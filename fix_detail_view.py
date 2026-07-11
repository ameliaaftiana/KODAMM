import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/MemberPortal/MemberCommodityRequestDetailView.swift"
with open(filepath, "r") as f:
    content = f.read()

content = content.replace("Image(request.imageName)", 'Image("gayo_beans")')
content = content.replace("private func statusDescription(for status: MemberCommodityRequest.RequestStatus) -> String {", "private func statusDescription(for status: CommodityRequestStatus) -> String {")
content = content.replace("""        case .new:
            return "Permintaan Anda sedang menunggu persetujuan dari Koperasi."
        case .processing, .testing:
            return "Komoditas Anda sedang dalam tahap uji laboratorium untuk memastikan kualitas."
        case .tested:
            return "Uji laboratorium selesai! Sertifikat kualitas telah terbit dan siap dijual." """, """        case .pending:
            return "Permintaan Anda sedang menunggu persetujuan dari Koperasi."
        case .approved, .testing:
            return "Komoditas Anda sedang diproses atau dalam tahap uji laboratorium untuk memastikan kualitas."
        case .tested:
            return "Uji laboratorium selesai! Sertifikat kualitas telah terbit dan siap dijual."
        case .rejected:
            return "Permintaan Anda ditolak." """)

with open(filepath, "w") as f:
    f.write(content)
print("Fixed MemberCommodityRequestDetailView.swift")
