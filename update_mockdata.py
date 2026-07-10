import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Models/MockData.swift"
with open(filepath, "r") as f:
    content = f.read()

# Add new Models
new_models = """

// MARK: - Member Commodity Request
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
    
    var colorName: String {
        switch self {
        case .pending: return "amberGold"
        case .approved: return "emeraldGreen"
        case .rejected: return "destructiveRed"
        case .testing: return "scientificCyan"
        }
    }
}

// MARK: - Coop Lab Test Item
struct CoopLabTestItem: Identifiable {
    let id: String
    let reqNumber: String
    let variety: String
    let dateSubmitted: String
    let status: String
    let certificate: LabCertificate?
}

"""

# Insert before Filter Origin
content = content.replace("// MARK: - Filter Origin", new_models + "\n// MARK: - Filter Origin")

# Add Sample Data
new_sample_data = """

    // MARK: Member Requests
    static let memberRequests: [MemberCommodityRequest] = [
        MemberCommodityRequest(id: "req-01", memberName: "Budi Santoso", memberAvatar: "person.circle.fill", variety: "Arabica Gayo", quantityKg: 500, processType: "Full Washed", dateSubmitted: "12 Okt 2026", status: .pending),
        MemberCommodityRequest(id: "req-02", memberName: "Siti Rahma", memberAvatar: "person.crop.circle.fill", variety: "Arabica Gayo", quantityKg: 200, processType: "Natural", dateSubmitted: "11 Okt 2026", status: .testing)
    ]
    
    // MARK: Coop Lab Tests
    static let coopLabTests: [CoopLabTestItem] = [
        CoopLabTestItem(id: "test-01", reqNumber: "LAB-26-001", variety: "Arabica Gayo - Full Washed", dateSubmitted: "10 Okt 2026", status: "Selesai", certificate: gayoCertificate),
        CoopLabTestItem(id: "test-02", reqNumber: "LAB-26-002", variety: "Arabica Gayo - Natural", dateSubmitted: "12 Okt 2026", status: "Diproses", certificate: nil)
    ]

"""

# Insert before "// MARK: Admin Users" or at the end of enum SampleData { ... }
# Let's find the end of SampleData
if "// MARK: Lab Requests" in content:
    content = content.replace("// MARK: Lab Requests", new_sample_data + "\n    // MARK: Lab Requests")

with open(filepath, "w") as f:
    f.write(content)
print("Updated MockData.swift")
