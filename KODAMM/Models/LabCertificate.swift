import Foundation

struct LabCertificate: Identifiable {
    let id: String
    let certCode: String
    let barcodeString: String
    let moisturePercent: Double
    let densityGml: Double
    let defectCount: Int
    let sniGrade: String
    let isHalalCertified: Bool
    let halalCertificateNumber: String
    let tanyakanPadaAiContext: String

    // SCA Score Breakdown
    let scaTotal: Double
    let scaRasa: Double
    let scaKeseimbangan: Double
    let scaBody: Double
    let scaKeasaman: Double
    let scaAroma: Double
    let scaAftertaste: Double
}
