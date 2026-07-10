import SwiftUI

// MARK: - Buyer Cart View
/// Shopping cart page showing selected commodity lots.
/// Styled to match the same warm ivory aesthetic as other pages.
struct BuyerCartView: View {
    @State private var cartItems: [(lot: CoffeeLot, quantity: Int)] = [
        (SampleData.coffeeLots[0], 100),
        (SampleData.coffeeLots[1], 50),
    ]

    private var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.lot.pricePerKg * Double($1.quantity)) }
    }

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Title
                        Text("Keranjang")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingLG)

                        Text("\(cartItems.count) item")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .padding(.horizontal, KODAMTheme.spacingLG)

                        // Cart Items
                        LazyVStack(spacing: KODAMTheme.spacingMD) {
                            ForEach(Array(cartItems.enumerated()), id: \.offset) { index, item in
                                cartItemCard(item: item, index: index)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Order summary
                        GlassCard {
                            VStack(spacing: KODAMTheme.spacingMD) {
                                summaryRow(label: "Subtotal", value: totalPrice.formattedRupiah())
                                summaryRow(label: "Estimasi Ongkir", value: "Rp. 375.000")
                                summaryRow(label: "Kontribusi RBF (15%)", value: (totalPrice * 0.15).formattedRupiah())

                                Divider()

                                HStack {
                                    Text("Total Harga")
                                        .font(KODAMFonts.heading(.title3))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Spacer()
                                    Text((totalPrice + 375000.0).formattedRupiah())
                                        .font(KODAMFonts.heading(.title1))
                                        .foregroundStyle(KODAMTheme.espressoAccent)
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        Spacer(minLength: 100)
                    }
                }

                // Checkout Button
                VStack(spacing: 0) {
                    Divider()

                    Button {
                        // Checkout action
                    } label: {
                        Text("Beli Sekarang")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, KODAMTheme.spacingLG)
                            .background(
                                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                    .fill(KODAMTheme.espressoAccent)
                            )
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.vertical, KODAMTheme.spacingMD)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                    )
                }
                .sensoryFeedback(.impact(weight: .medium), trigger: cartItems.count)
            }
            .navigationBarHidden(true)
        }
    }

    private func cartItemCard(item: (lot: CoffeeLot, quantity: Int), index: Int) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            HStack(spacing: KODAMTheme.spacingMD) {
                // Thumbnail
                RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                    .fill(
                        LinearGradient(
                            colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 72, height: 72)
                    .overlay {
                        Image(systemName: "leaf.fill")
                            .font(KODAMFonts.heading(.title1))
                            .foregroundStyle(.white.opacity(0.3))
                    }

                VStack(alignment: .leading, spacing: 4) {
                    Text(item.lot.title)
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .lineLimit(1)

                    Text(item.lot.cooperativeCode)
                        .font(KODAMFonts.mono(.caption2))
                        .foregroundStyle(KODAMTheme.textSecondary)

                    HStack {
                        Text("\(item.quantity) kg")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)

                        Spacer()

                        Text((item.lot.pricePerKg * Double(item.quantity)).formattedRupiah())
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }
            }
        }
    }

    private func summaryRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(KODAMTheme.textSecondary)
            Spacer()
            Text(value)
                .font(KODAMFonts.body(.bodyLarge))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    BuyerCartView()
}
