import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/UserPortal/BuyerProductDetailView.swift"
with open(filepath, "r") as f:
    content = f.read()

# 1. Add Title below Hero Image
hero_section_end = """                    // MARK: Hero Image
                    heroImageSection

                    VStack(spacing: KODAMTheme.spacingXL) {"""

title_section = """                    // MARK: Hero Image
                    heroImageSection

                    VStack(spacing: KODAMTheme.spacingXL) {
                        // MARK: Title Section
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lot.title)
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Text("\\(lot.originDusun), \\(lot.province) • \\(lot.processType)")
                                .font(KODAMFonts.body(.body))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
"""

content = content.replace(hero_section_end, title_section)

# Update Hero image to use real image instead of placeholder
hero_placeholder = """            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientMid, KODAMTheme.coffeeGradientEnd],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 280)
                .overlay {
                    // Decorative coffee plant overlay
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "leaf.fill")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(.white.opacity(0.08))
                                .rotationEffect(.degrees(25))
                                .offset(x: 20, y: 20)
                        }
                    }
                }"""

hero_real_image = """            Image(lot.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 280)
                .clipped()
                .overlay(Color.black.opacity(0.1))"""

content = content.replace(hero_placeholder, hero_real_image)

# 2. Extract Price & Stepper to purchaseOptionsSection and simplify purchaseBar
reviews_end = """                        // MARK: Reviews
                        reviewsSection

                        // Bottom spacing for purchase bar
                        Spacer(minLength: 120)"""

reviews_end_new = """                        // MARK: Reviews
                        reviewsSection

                        // MARK: Purchase Options
                        purchaseOptionsSection

                        // Bottom spacing for purchase bar
                        Spacer(minLength: 120)"""

content = content.replace(reviews_end, reviews_end_new)


purchase_bar_old = """    // MARK: - Purchase Bar
    private var purchaseBar: some View {
        VStack(spacing: 0) {
            Divider()

            HStack(spacing: KODAMTheme.spacingLG) {
                // Minimum + Price
                VStack(alignment: .leading, spacing: 4) {
                    Text("MIN. PEMBELIAN")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textTertiary)

                    HStack(spacing: 4) {
                        Text("HARGA /KG")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                        Text(lot.pricePerKg.formattedRupiah())
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }

                Spacer()

                // Quantity stepper
                HStack(spacing: 0) {
                    Button {
                        if quantity > 100 { quantity -= 10 }
                    } label: {
                        Image(systemName: "minus")
                            .font(KODAMFonts.heading(.headline))
                            .frame(width: 32, height: 32)
                    }
                    .tint(KODAMTheme.textPrimary)

                    Text("\\(quantity) kg")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .frame(width: 56)

                    Button {
                        quantity += 10
                    } label: {
                        Image(systemName: "plus")
                            .font(KODAMFonts.heading(.headline))
                            .frame(width: 32, height: 32)
                    }
                    .tint(KODAMTheme.textPrimary)
                }
                .background(
                    RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                )

                // Buy button
                Button {
                    // Checkout action
                } label: {
                    Text("Beli Sekarang")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(.white)
                        .padding(.horizontal, KODAMTheme.spacingXL)
                        .padding(.vertical, KODAMTheme.spacingMD)
                        .background(
                            Capsule()
                                .fill(KODAMTheme.espressoAccent)
                        )
                }
                .sensoryFeedback(.impact(weight: .medium), trigger: quantity)
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .shadow(color: KODAMTheme.obsidianDark.opacity(0.05), radius: 8, x: 0, y: -2)
            )
        }
    }"""

purchase_bar_new = """    // MARK: - Purchase Options Section
    private var purchaseOptionsSection: some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                Text("Opsi Pembelian")
                    .font(KODAMFonts.heading(.title3))
                    .foregroundStyle(KODAMTheme.textPrimary)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("HARGA /KG")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                        Text(lot.pricePerKg.formattedRupiah())
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                }

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("JUMLAH (MIN 100 KG)")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                        
                        // Quantity stepper
                        HStack(spacing: 0) {
                            Button {
                                if quantity > 100 { quantity -= 10 }
                            } label: {
                                Image(systemName: "minus")
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(width: 44, height: 44)
                            }
                            .tint(KODAMTheme.textPrimary)

                            Text("\\(quantity) kg")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .frame(width: 80)
                                .multilineTextAlignment(.center)

                            Button {
                                quantity += 10
                            } label: {
                                Image(systemName: "plus")
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(width: 44, height: 44)
                            }
                            .tint(KODAMTheme.textPrimary)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                        )
                    }
                    Spacer()
                }
            }
        }
    }

    // MARK: - Purchase Bar
    private var purchaseBar: some View {
        VStack(spacing: 0) {
            Divider()

            HStack(spacing: KODAMTheme.spacingMD) {
                // Tambah Keranjang Button
                Button {
                    // Add to cart action
                } label: {
                    Text("Tambahkan Keranjang")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.espressoAccent)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, KODAMTheme.spacingMD)
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                                .strokeBorder(KODAMTheme.espressoAccent, lineWidth: 2)
                        )
                }

                // Buy button
                Button {
                    // Checkout action
                } label: {
                    Text("Beli Sekarang")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, KODAMTheme.spacingMD)
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                                .fill(KODAMTheme.espressoAccent)
                        )
                }
                .sensoryFeedback(.impact(weight: .medium), trigger: quantity)
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .shadow(color: KODAMTheme.obsidianDark.opacity(0.05), radius: 8, x: 0, y: -2)
            )
        }
    }"""

content = content.replace(purchase_bar_old, purchase_bar_new)

with open(filepath, "w") as f:
    f.write(content)
print("BuyerProductDetailView updated.")
