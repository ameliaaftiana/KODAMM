import SwiftUI

// MARK: - KODAM Search Bar
/// Custom search bar with warm ivory background and filter icon.
struct KODAMSearchBar: View {
    @Binding var text: String
    var placeholder: String = "Cari asal, varietas..."
    var showFilterButton: Bool = true
    var onFilterTap: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: KODAMTheme.spacingMD) {
            HStack(spacing: KODAMTheme.spacingSM) {
                Image(systemName: "magnifyingglass")
                    .font(KODAMFonts.heading(.title3))
                    .foregroundStyle(KODAMTheme.textTertiary)

                TextField(placeholder, text: $text)
                    .font(KODAMFonts.body(.body))
                    .foregroundStyle(KODAMTheme.textPrimary)

                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.textTertiary)
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingMD)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                    .fill(KODAMTheme.warmIvoryDarker)
            )

            if showFilterButton {
                Button {
                    onFilterTap?()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.espressoAccent)
                        .frame(width: 44, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                .fill(KODAMTheme.warmIvoryDarker)
                        )
                }
            }
        }
    }
}

#Preview {
    VStack {
        KODAMSearchBar(text: .constant(""))
        KODAMSearchBar(text: .constant("Gayo"), showFilterButton: false)
    }
    .padding()
    .background(KODAMTheme.warmIvory)
}
