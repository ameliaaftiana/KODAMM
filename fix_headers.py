import os

marketplace = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/MarketplaceFeedView.swift"
with open(marketplace, "r") as f:
    content = f.read()

nav_bar_code = """                        // Custom Navigation Bar
                        KODAMNavigationBar(
                            title: "KODAM",
                            showAvatar: true,
                            trailingIcon: "sparkle"
                        )"""

pasar_header = """                        // Title
                        Text("Pasar")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingLG)
                            .frame(maxWidth: .infinity, alignment: .leading)"""

if nav_bar_code in content:
    content = content.replace(nav_bar_code, pasar_header)
    with open(marketplace, "w") as f:
        f.write(content)
    print("Fixed MarketplaceFeedView")

cart = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/BuyerCartView.swift"
with open(cart, "r") as f:
    content = f.read()

keranjang_code_old = """                        // Header
                        Text("Keranjang")
                            .font(KODAMFonts.heading(.title1))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, KODAMTheme.spacingLG)
                            .padding(.bottom, KODAMTheme.spacingXL)"""

keranjang_code_new = """                        // Header
                        Text("Keranjang")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingLG)
                            .padding(.bottom, KODAMTheme.spacingMD)
                            .frame(maxWidth: .infinity, alignment: .leading)"""

if keranjang_code_old in content:
    content = content.replace(keranjang_code_old, keranjang_code_new)
    with open(cart, "w") as f:
        f.write(content)
    print("Fixed BuyerCartView")
