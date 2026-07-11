import os

# 1. LabDashboardView
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/LabPortal/LabDashboardView.swift"
with open(filepath, "r") as f:
    content = f.read()

old_header_1 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("KODAM Lab")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            
                            Text("Sedang Diproses")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("• \\(SampleData.labProcessingItems.count) Sampel Aktif")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.espressoAccent.opacity(0.1))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .padding(.top, KODAMTheme.spacingXS)
                        }"""

new_header_1 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Sedang Diproses")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }"""

content = content.replace(old_header_1, new_header_1)
with open(filepath, "w") as f:
    f.write(content)
print("Updated LabDashboardView.swift")

# 2. LabAntreanView
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/LabPortal/LabAntreanView.swift"
with open(filepath, "r") as f:
    content = f.read()

old_header_2 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "chart.bar.doc.horizontal")
                                    .font(KODAMFonts.heading(.title2))
                                Text("KODAM Lab")
                                    .font(KODAMFonts.heading(.title3))
                            }
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.bottom, KODAMTheme.spacingSM)
                            
                            Text("Antrean Pengajuan")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("\\(SampleData.labRequests.count) Permintaan Baru")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.oliveGreen.opacity(0.15))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .padding(.top, KODAMTheme.spacingXS)
                        }"""

new_header_2 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Antrean Pengajuan")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }"""

content = content.replace(old_header_2, new_header_2)
with open(filepath, "w") as f:
    f.write(content)
print("Updated LabAntreanView.swift")

# 3. LabArsipView
filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/LabPortal/LabArsipView.swift"
with open(filepath, "r") as f:
    content = f.read()

old_header_3 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "flask")
                                    .font(KODAMFonts.heading(.title2))
                                Text("KODAM Lab")
                                    .font(KODAMFonts.heading(.title3))
                            }
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.bottom, KODAMTheme.spacingSM)
                            
                            Text("Arsip Sertifikat")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("156 Sertifikat Terbit")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.cardWhite.opacity(0.8))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                                )
                                .padding(.top, KODAMTheme.spacingXS)
                        }"""

new_header_3 = """                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Arsip Sertifikat")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }"""

content = content.replace(old_header_3, new_header_3)
with open(filepath, "w") as f:
    f.write(content)
print("Updated LabArsipView.swift")

