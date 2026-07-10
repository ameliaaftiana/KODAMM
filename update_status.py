import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Models/MockData.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """    case pending = "Menunggu Proses"
    case approved = "Disetujui"
    case rejected = "Ditolak"
    case testing = "Sedang Uji Lab\""""

replacement = """    case pending = "Menunggu Proses"
    case approved = "Disetujui"
    case rejected = "Ditolak"
    case testing = "Sedang Uji Lab"
    case tested = "Selesai Uji Lab\""""

target2 = """        case .rejected: return "destructiveRed"
        case .testing: return "scientificCyan\""""

replacement2 = """        case .rejected: return "destructiveRed"
        case .testing: return "scientificCyan"
        case .tested: return "emeraldGreen\""""


if target in content:
    content = content.replace(target, replacement)
    content = content.replace(target2, replacement2)
    
    # Add a mock data item that is .tested
    target3 = """MemberCommodityRequest(id: "req-02", memberName: "Siti Rahma", memberAvatar: "person.crop.circle.fill", variety: "Arabica Gayo", quantityKg: 200, processType: "Natural", dateSubmitted: "11 Okt 2026", status: .testing)"""
    replacement3 = """MemberCommodityRequest(id: "req-02", memberName: "Siti Rahma", memberAvatar: "person.crop.circle.fill", variety: "Arabica Gayo", quantityKg: 200, processType: "Natural", dateSubmitted: "11 Okt 2026", status: .testing),
        MemberCommodityRequest(id: "req-03", memberName: "Agus Setiawan", memberAvatar: "person.circle", variety: "Arabica Gayo", quantityKg: 150, processType: "Honey", dateSubmitted: "09 Okt 2026", status: .tested)"""
    
    content = content.replace(target3, replacement3)
    
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated MockData.swift")
else:
    print("Could not find target in MockData.swift")
