import SwiftUI

// MARK: - Order Card
/// Order tracking card matching reference Image 3 (Pesanan Saya).
/// Shows order number, product name, status badge, thumbnail, quantity, estimated date, and price.
struct OrderCard: View {
    let order: Order

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Header: Order number + Status badge
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("PESANAN #\(order.orderNumber)")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)

                        Text(order.productName)
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .lineLimit(2)
                    }

                    Spacer()

                    StatusBadge(status: order.status)
                }

                Divider()
                    .foregroundStyle(KODAMTheme.cardBorder)

                // Body: Thumbnail + Details + Price
                HStack(alignment: .center, spacing: KODAMTheme.spacingMD) {
                    // Coffee thumbnail placeholder
                    RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                        .fill(
                            LinearGradient(
                                colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 64, height: 64)
                        .overlay {
                            Image(systemName: "cup.and.saucer.fill")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(.white.opacity(0.4))
                        }

                    // Details
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Jumlah: \(order.quantityKg)kg")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textPrimary)

                        Text(estimateLabel)
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }

                    Spacer()

                    // Price + Track
                    VStack(alignment: .trailing, spacing: KODAMTheme.spacingSM) {
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Total Harga")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textTertiary)
                            Text(order.totalPrice.formattedRupiah())
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                                .fixedSize(horizontal: true, vertical: false)
                        }

                        Button {
                            // Track action
                        } label: {
                            Text("Lacak")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                                .padding(.horizontal, KODAMTheme.spacingLG)
                                .padding(.vertical, KODAMTheme.spacingSM)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(KODAMTheme.espressoAccent, lineWidth: 1)
                                )
                        }
                    }
                }
            }
        }
    }

    private var estimateLabel: String {
        switch order.status {
        case .inTransit:
            return "Estimasi Tiba: \(order.estimatedDate)"
        case .processing:
            return "Estimasi Kirim: \(order.estimatedDate)"
        case .completed:
            return "Tiba: \(order.estimatedDate)"
        case .cancelled:
            return "Dibatalkan"
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        OrderCard(order: SampleData.orders[0])
        OrderCard(order: SampleData.orders[1])
    }
    .padding()
    .background(KODAMTheme.warmIvory)
}
