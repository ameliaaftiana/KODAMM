import SwiftUI

// MARK: - KODAM Navigation Bar
/// Custom top navigation bar with avatar, title, and action button.
struct KODAMNavigationBar: View {
    var title: String = "KODAM"
    var showAvatar: Bool = true
    var trailingIcon: String = "sparkle"
    var onTrailingTap: (() -> Void)? = nil

    var body: some View {
        HStack {
            if showAvatar {
                // Avatar placeholder
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [KODAMTheme.espressoAccent, KODAMTheme.amberGold],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(.white)
                    )
            }

            Spacer()

            Text(title)
                .font(KODAMFonts.heading(.title2))
                .foregroundStyle(KODAMTheme.textPrimary)

            Spacer()

            Button {
                onTrailingTap?()
            } label: {
                Image(systemName: trailingIcon)
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.espressoAccent)
                    .frame(width: 36, height: 36)
            }
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
        .padding(.vertical, KODAMTheme.spacingSM)
    }
}

#Preview {
    VStack {
        KODAMNavigationBar()
        Divider()
        KODAMNavigationBar(title: "Pesan", showAvatar: false, trailingIcon: "ellipsis")
    }
    .background(KODAMTheme.warmIvory)
}
