import SwiftUI

// MARK: - Halal Badge
/// Green pill badge indicating halal certification status.
struct HalalBadge: View {
    var body: some View {
        Text("Halal")
            .font(KODAMFonts.body(.captionSmall))
            .foregroundStyle(.white)
            .padding(.horizontal, KODAMTheme.spacingMD)
            .padding(.vertical, KODAMTheme.spacingXS)
            .background(
                Capsule()
                    .fill(KODAMTheme.halalBadgeBackground)
            )
    }
}

#Preview {
    HalalBadge()
        .padding()
        .background(KODAMTheme.cardBorder)
}
