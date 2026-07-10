import os
import re

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopLotDetailView.swift"
with open(filepath, "r") as f:
    content = f.read()

# 1. Update font weights
content = content.replace(
    'Text("Analisis\\nLaboratorium")\n                        .font(KODAMFonts.heading(.title3))',
    'Text("Analisis\\nLaboratorium")\n                        .font(KODAMFonts.heading(.title3).weight(.bold))'
)
content = content.replace(
    'Text("Skor SCA")\n                            .font(KODAMFonts.heading(.title3))',
    'Text("Skor SCA")\n                            .font(KODAMFonts.heading(.title3).weight(.bold))'
)
content = content.replace(
    'Text("Ulasan & Penilaian")\n                        .font(KODAMFonts.heading(.title3))',
    'Text("Ulasan & Penilaian")\n                        .font(KODAMFonts.heading(.title3).weight(.bold))'
)

# 2. Add navigationBarHidden and Custom Back Button
# First, remove the old toolbar modifiers
content = content.replace(".navigationBarTitleDisplayMode(.inline)", "")
content = content.replace(".toolbarBackground(KODAMTheme.warmIvory, for: .navigationBar)", "")

# Find body ZStack
body_match = re.search(r'(var body: some View \{\s*ZStack\(alignment: \.bottom\) \{\s*KODAMTheme\.warmIvory\s*\.ignoresSafeArea\(\)\s*)(ScrollView\(\.vertical, showsIndicators: false\) \{)', content)

if body_match:
    scroll_view_replacement = body_match.group(1) + "ScrollView(.vertical, showsIndicators: false) {"
    content = content.replace(body_match.group(0), scroll_view_replacement)

# To add ignoresSafeArea(edges: .top) to the ScrollView, and the Custom back button
# The structure ends around editBar. Let's find editBar
edit_bar_match = re.search(r'// MARK: Sticky Purchase Bar\s*editBar\s*\}\s*', content)
if edit_bar_match:
    new_tail = """// MARK: Sticky Purchase Bar
            editBar

            // MARK: Custom Navigation Bar
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(.white)
                            .padding(12)
                            .background(KODAMTheme.obsidianDark.opacity(0.4))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, 60)
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarHidden(true)
"""
    content = content.replace(edit_bar_match.group(0), new_tail)

# 3. Replace RadarChartView with scaBarChart
content = content.replace(
    """                RadarChartView(certificate: cert)
                    .frame(height: 220)""",
    "                scaBarChart(cert)"
)

# Insert the scaBarChart function
new_funcs = """
    private func scaBarChart(_ cert: LabCertificate) -> some View {
        VStack(spacing: KODAMTheme.spacingSM) {
            scaBarRow(label: "Rasa", value: cert.scaRasa)
            scaBarRow(label: "Aroma", value: cert.scaAroma)
            scaBarRow(label: "Keasaman", value: cert.scaKeasaman)
            scaBarRow(label: "Body", value: cert.scaBody)
            scaBarRow(label: "Balance", value: cert.scaKeseimbangan)
            scaBarRow(label: "Aftertaste", value: cert.scaAftertaste)
        }
        .padding(.top, KODAMTheme.spacingSM)
    }

    private func scaBarRow(label: String, value: Double) -> some View {
        let maxScore = 10.0
        return HStack {
            Text(label)
                .font(KODAMFonts.body(.caption))
                .foregroundStyle(KODAMTheme.textSecondary)
                .frame(width: 80, alignment: .leading)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(KODAMTheme.warmIvoryDarker)
                    Capsule()
                        .fill(KODAMTheme.espressoAccent)
                        .frame(width: geo.size.width * CGFloat(value / maxScore))
                }
            }
            .frame(height: 8)

            Text(String(format: "%.1f", value))
                .font(KODAMFonts.mono(.caption))
                .foregroundStyle(KODAMTheme.textPrimary)
                .frame(width: 30, alignment: .trailing)
        }
    }
"""

if "// MARK: - Reviews Section" in content:
    content = content.replace("// MARK: - Reviews Section", new_funcs + "\n    // MARK: - Reviews Section")


# 4. Add TextField and Send button to AI Sheet
ai_chips_block = """                        FlowLayout(spacing: KODAMTheme.spacingSM) {
                            aiChip("Profil roasting yang cocok?")
                            aiChip("Cocok untuk espresso blend?")
                            aiChip("Berapa lama bisa disimpan?")
                            aiChip("Perbandingan dengan Bajawa?")
                        }"""

ai_input_block = """                        FlowLayout(spacing: KODAMTheme.spacingSM) {
                            aiChip("Profil roasting yang cocok?")
                            aiChip("Cocok untuk espresso blend?")
                            aiChip("Berapa lama bisa disimpan?")
                            aiChip("Perbandingan dengan Bajawa?")
                        }

                        Spacer()
                        
                        // NEW: Text input and send button
                        HStack(spacing: KODAMTheme.spacingSM) {
                            TextField("Tanya AI...", text: .constant(""))
                                .font(KODAMFonts.body(.body))
                                .padding(KODAMTheme.spacingMD)
                                .background(KODAMTheme.cardWhite)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))
                                .overlay(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                                )
                                
                            Button {
                                // send action
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .padding(KODAMTheme.spacingMD)
                                    .background(KODAMTheme.espressoAccent)
                                    .clipShape(Circle())
                            }
                        }"""

content = content.replace(ai_chips_block, ai_input_block)


with open(filepath, "w") as f:
    f.write(content)
print("Updated CoopLotDetailView.swift successfully")
