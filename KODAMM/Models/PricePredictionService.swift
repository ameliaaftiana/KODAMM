import Foundation
import CoreML

struct YahooFinanceResponse: Codable {
    let chart: Chart
}

struct Chart: Codable {
    let result: [ChartResult]?
    let error: ChartError?
}

struct ChartError: Codable {
    let code: String
    let description: String
}

struct ChartResult: Codable {
    let meta: ChartMeta
    let timestamp: [Int]
    let indicators: ChartIndicators
}

struct ChartMeta: Codable {
    let regularMarketPrice: Double
}

struct ChartIndicators: Codable {
    let quote: [Quote]
}

struct Quote: Codable {
    let close: [Double?]
    let volume: [Int64?]
}

class PricePredictionService {
    static let shared = PricePredictionService()
    
    private let coffeeURL = URL(string: "https://query1.finance.yahoo.com/v8/finance/chart/KC=F?range=1mo&interval=1d")!
    private let idrURL = URL(string: "https://query1.finance.yahoo.com/v8/finance/chart/IDR=X?range=1mo&interval=1d")!
    private let oilURL = URL(string: "https://query1.finance.yahoo.com/v8/finance/chart/CL=F?range=1mo&interval=1d")!
    
    private func fetchFinanceData(url: URL) async throws -> ChartResult {
        var request = URLRequest(url: url)
        // Set a generic User-Agent to avoid 403 Forbidden / 429 Too Many Requests on Yahoo Finance
        request.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1", forHTTPHeaderField: "User-Agent")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoded = try JSONDecoder().decode(YahooFinanceResponse.self, from: data)
        guard let result = decoded.chart.result?.first else {
            throw URLError(.cannotParseResponse)
        }
        
        return result
    }
    
    func predictCoffeePrice() async throws -> Double {
        async let coffeeTask = fetchFinanceData(url: coffeeURL)
        async let idrTask = fetchFinanceData(url: idrURL)
        async let oilTask = fetchFinanceData(url: oilURL)
        
        let (coffeeData, idrData, oilData) = try await (coffeeTask, idrTask, oilTask)
        
        // Extract coffee features
        let coffeeCloses = coffeeData.indicators.quote.first?.close.compactMap { $0 } ?? []
        let coffeeVolumes = coffeeData.indicators.quote.first?.volume.compactMap { $0 } ?? []
        
        guard coffeeCloses.count >= 8 else {
            throw URLError(.cannotParseResponse)
        }
        
        let latestCoffeeCents = coffeeCloses.last!
        let coffee7DaysAgo = coffeeCloses[coffeeCloses.count - 8]
        let coffee_7d_roc = (latestCoffeeCents - coffee7DaysAgo) / coffee7DaysAgo
        let global_coffee_usd_lb = latestCoffeeCents / 100.0 // KC=F is in US Cents/lb
        let coffee_volume = coffeeVolumes.last ?? 0
        
        // Extract IDR features
        let idrCloses = idrData.indicators.quote.first?.close.compactMap { $0 } ?? []
        guard idrCloses.count >= 14 else {
            throw URLError(.cannotParseResponse)
        }
        
        let usd_idr_rate = idrCloses.last!
        let last14Idr = idrCloses.suffix(14)
        let usd_idr_14d_ma = last14Idr.reduce(0, +) / Double(last14Idr.count)
        
        // Extract Oil features
        let oilCloses = oilData.indicators.quote.first?.close.compactMap { $0 } ?? []
        guard let crude_oil_usd = oilCloses.last else {
            throw URLError(.cannotParseResponse)
        }
        
        // Model prediction
        do {
            let config = MLModelConfiguration()
            let model = try CoffeeBeanPricePred___KODAM(configuration: config)
            
            let prediction = try model.prediction(
                global_coffee_usd_lb: global_coffee_usd_lb,
                usd_idr_rate: usd_idr_rate,
                usd_idr_14d_ma: usd_idr_14d_ma,
                crude_oil_usd: crude_oil_usd,
                coffee_volume: coffee_volume,
                coffee_7d_roc: coffee_7d_roc
            )
            
            return prediction.Label
        } catch {
            print("Prediction error: \(error)")
            throw error
        }
    }
}
