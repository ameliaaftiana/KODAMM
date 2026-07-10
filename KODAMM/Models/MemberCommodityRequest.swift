import Foundation

struct MemberCommodityRequest: Identifiable {
    let id: String
    let memberName: String
    let memberAvatar: String
    let variety: String
    let quantityKg: Int
    let processType: String
    let dateSubmitted: String
    let status: CommodityRequestStatus
}

enum CommodityRequestStatus: String, CaseIterable {
    case pending = "Menunggu Proses"
    case approved = "Disetujui"
    case rejected = "Ditolak"
    case testing = "Sedang Uji Lab"
    case tested = "Selesai Uji Lab"
    
    var colorName: String {
        switch self {
        case .pending: return "amberGold"
        case .approved: return "emeraldGreen"
        case .rejected: return "destructiveRed"
        case .testing: return "scientificCyan"
        case .tested: return "emeraldGreen"
        }
    }
}
