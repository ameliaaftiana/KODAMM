import SwiftUI

// MARK: - Score Badge
/// Cupping/SCA score overlay badge with star icon (e.g., ⭐ 86.5).
/// Positioned over product images as a floating indicator.
struct ScoreBadge: View {
    let score: Double
    let label: String

    init(score: Double, label: String = "SCA") {
        self.score = score
        self.label = label
    }

    var body: some View {
        VStack(spacing: 2) {
            Text(label)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(.white.opacity(0.85))

            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                    .font(KODAMFonts.body(.captionSmall))
                    .foregroundStyle(KODAMTheme.amberGold)

                Text(String(format: "%.1f", score))
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, KODAMTheme.spacingMD)
        .padding(.vertical, KODAMTheme.spacingSM)
        .background(
            RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                .fill(KODAMTheme.scoreBadgeBackground)
        )
    }
}

#Preview {
    ScoreBadge(score: 86.5)
        .padding()
        .background(KODAMTheme.warmIvoryDarker)
}
