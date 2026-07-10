import SwiftUI

// MARK: - Grade Badge
/// Pill-shaped badge displaying SNI grade (e.g. "Grade 1").
/// White background with subtle border.
struct GradeBadge: View {
    let grade: String

    var body: some View {
        Text(grade)
            .font(KODAMFonts.body(.captionSmall))
            .foregroundStyle(KODAMTheme.textPrimary)
            .padding(.horizontal, KODAMTheme.spacingMD)
            .padding(.vertical, KODAMTheme.spacingXS)
            .background(
                Capsule()
                    .fill(KODAMTheme.gradeBadgeBackground)
            )
            .overlay(
                Capsule()
                    .strokeBorder(KODAMTheme.cardBorder.opacity(0.6), lineWidth: 0.5)
            )
    }
}

#Preview {
    GradeBadge(grade: "Grade 1")
        .padding()
        .background(KODAMTheme.cardBorder)
}
