import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CoopMembersView.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """                // Title
                Text("Daftar Anggota")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .frame(maxWidth: .infinity, alignment: .leading)"""

replacement = """                // Back Button Header
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingMD)
                
                // Title and Total Member Count
                HStack(alignment: .bottom) {
                    Text("Daftar Anggota")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Spacer()
                    
                    Text("\(SampleData.coopMembers.count) Anggota")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .padding(.bottom, 6) // Align baseline visually
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingMD)"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CoopMembersView.swift")
else:
    print("Target not found in CoopMembersView.swift")
