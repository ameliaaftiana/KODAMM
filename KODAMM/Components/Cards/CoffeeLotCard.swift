import SwiftUI

// MARK: - Coffee Lot Card
/// Marketplace product card matching reference Image 1.
/// Shows coffee bean image with badge overlays, lot code, title, location, and price.
struct CoffeeLotCard: View {
    let lot: CoffeeLot
    var onTap: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                // MARK: Image + Badge Overlays
                ZStack(alignment: .bottom) {
                    // Coffee bean image
                    Image(lot.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))

                    // SCA Score badge (top-right)
                    VStack {
                        HStack {
                            Spacer()
                            ScoreBadge(score: lot.cuppingScore)
                        }
                        Spacer()
                    }
                    .padding(KODAMTheme.spacingMD)

                    // Grade + Halal badges (bottom-left)
                    HStack {
                        HStack(spacing: KODAMTheme.spacingXS) {
                            GradeBadge(grade: lot.sniGrade)
                            if lot.isHalalCertified {
                                HalalBadge()
                            }
                        }
                        Spacer()
                    }
                    .padding(KODAMTheme.spacingMD)
                }

                // MARK: Content
                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                    // Lot code + bookmark
                    HStack {
                        Text(lot.cooperativeCode)
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)

                        Spacer()

                        Image(systemName: "bookmark")
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }

                    // Title
                    Text(lot.title)
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    // Location
                    HStack(spacing: 4) {
                        Image(systemName: "mappin")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                        Text("\(lot.originDusun), \(lot.province)")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }

                    Divider()
                        .foregroundStyle(KODAMTheme.cardBorder)

                    // Price + CTA
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Harga per KG")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textTertiary)
                            Text(lot.pricePerKg.formattedRupiah())
                                .font(KODAMFonts.heading(.title1))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }

                        Spacer()

                        HStack(spacing: 4) {
                            Text("Lihat Lot")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                            Image(systemName: "arrow.right")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }
                    }
                }
                .padding(KODAMTheme.spacingLG)
            }
            .background(KODAMTheme.cardWhite)
            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))
            .shadow(color: KODAMTheme.obsidianDark.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    ScrollView {
        CoffeeLotCard(lot: SampleData.coffeeLots[0])
            .padding()
    }
    .background(KODAMTheme.warmIvory)
}
