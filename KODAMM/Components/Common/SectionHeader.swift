import SwiftUI

// MARK: - Section Header
/// Reusable section header with title and optional trailing action.
struct SectionHeader: View {
    let title: String
    var subtitle: String? = nil
    var trailingText: String? = nil
    var trailingAction: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(KODAMFonts.heading(.title3).weight(.bold))
                    .foregroundStyle(KODAMTheme.textPrimary)

                if let subtitle {
                    Text(subtitle)
                        .font(KODAMFonts.body(.bodySmall))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
            }

            Spacer()

            if let trailingText {
                Button {
                    trailingAction?()
                } label: {
                    HStack(spacing: 4) {
                        Text(trailingText)
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.espressoAccent)
                        Image(systemName: "arrow.right")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.espressoAccent)
                    }
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        SectionHeader(title: "Ulasan & Penilaian")
        SectionHeader(
            title: "Transparansi RBF",
            subtitle: "Revenue-Based Financing",
            trailingText: "Lihat Semua"
        )
    }
    .padding()
    .background(KODAMTheme.warmIvory)
}
