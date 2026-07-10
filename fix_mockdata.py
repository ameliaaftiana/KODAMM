import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Models/MockData.swift"
with open(filepath, "r") as f:
    content = f.read()

if "memberRequests" in content:
    print("memberRequests is found in MockData.swift!")
else:
    print("memberRequests is NOT found in MockData.swift!")
    # Append it right before the last closing brace.
    parts = content.rsplit("}", 1)
    if len(parts) == 2:
        new_content = parts[0] + """
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
}"""
        with open(filepath, "w") as f:
            f.write(new_content)
        print("memberRequests injected!")
