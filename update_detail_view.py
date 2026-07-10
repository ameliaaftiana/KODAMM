import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopCommodityRequestDetailView.swift"
with open(filepath, "r") as f:
    content = f.read()

# Target for Hero Image
target_header = """                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {"""

replacement_header = """                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Hero Image
                        Image("gayo_beans") // Placeholder image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            .padding(.horizontal, KODAMTheme.spacingLG)"""

# Target for Description in Main Info Card
target_info = """                                    VStack(alignment: .trailing, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Kuantitas", value: "\(request.quantityKg) kg", trailing: true)
                                        detailRow(title: "ID Tiket", value: request.id, trailing: true)
                                    }
                                }"""

replacement_info = """                                    VStack(alignment: .trailing, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Kuantitas", value: "\(request.quantityKg) kg", trailing: true)
                                        detailRow(title: "ID Tiket", value: request.id, trailing: true)
                                    }
                                }
                                
                                Divider()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Deskripsi Tambahan")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Text("Mohon bantuannya untuk memproses lot ini secepatnya karena sedang butuh dana segar. Kualitas biji kopi dijamin bagus hasil panen bulan ini.")
                                        .font(KODAMFonts.body(.bodySmall))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }"""

if target_header in content and target_info in content:
    content = content.replace(target_header, replacement_header)
    content = content.replace(target_info, replacement_info)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopCommodityRequestDetailView.swift")
else:
    print("Could not find targets in CoopCommodityRequestDetailView.swift")
