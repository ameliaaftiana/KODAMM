import Foundation

struct Order: Identifiable {
    let id: String
    let orderNumber: String
    let productName: String
    let status: OrderStatus
    let quantityKg: Int
    let estimatedDate: String
    let totalPrice: Double
    let imageName: String
    let cooperativeName: String
}

enum OrderStatus: String, CaseIterable {
    case inTransit = "Dalam Perjalanan"
    case processing = "Diproses"
    case completed = "Selesai"
    case cancelled = "Dibatalkan"

    var icon: String {
        switch self {
        case .inTransit: return "shippingbox.fill"
        case .processing: return "doc.text.fill"
        case .completed: return "checkmark.circle.fill"
        case .cancelled: return "xmark.circle.fill"
        }
    }

    var displayColor: String {
        switch self {
        case .inTransit: return "amberGold"
        case .processing: return "emeraldGreen"
        case .completed: return "scientificCyan"
        case .cancelled: return "destructiveRed"
        }
    }
}
