import Foundation

struct CoffeeLot: Identifiable, Hashable {
    let id: String
    let cooperativeCode: String
    let title: String
    let originDusun: String
    let province: String
    let processType: String
    let pricePerKg: Double
    let availableKg: Int
    let cuppingScore: Double
    let sniGrade: String
    let isHalalCertified: Bool
    let imageName: String
    let labCertificate: LabCertificate?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: CoffeeLot, rhs: CoffeeLot) -> Bool {
        lhs.id == rhs.id
    }
}
