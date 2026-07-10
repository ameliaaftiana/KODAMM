import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/CooperativePortal/CooperativePortalMainView.swift"
with open(filepath, "r") as f:
    content = f.read()

target = """            // Placeholder for Uji Lab
            NavigationView {
                ZStack {
                    KODAMTheme.warmIvory.ignoresSafeArea()
                    VStack {
                        KODAMNavigationBar(title: "Uji Lab", showAvatar: false)
                        Spacer()
                        Text("Halaman Uji Lab")
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Spacer()
                    }
                    .navigationBarHidden(true)
                }
            }"""

replacement = """            CoopLabTestsView()"""

if target in content:
    content = content.replace(target, replacement)
    with open(filepath, "w") as f:
        f.write(content)
    print("Updated CooperativePortalMainView.swift")
else:
    print("Failed to find placeholder in CooperativePortalMainView.swift")
