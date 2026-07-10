import SwiftUI

// MARK: - Lab Parameter Card
struct LabParameterCard: View {
    let title: String
    let description: String
    let iconName: String

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                // Circle Icon
                Circle()
                    .fill(KODAMTheme.cardWhite.opacity(0.8))
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: iconName)
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }

                Spacer(minLength: 8)

                // Title and Description
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Text(description)
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        HStack {
            LabParameterCard(
                title: "Kadar Air",
                description: "Analisis kelembaban presisi",
                iconName: "drop.fill"
            )
            LabParameterCard(
                title: "Cacat Fisik",
                description: "Identifikasi defect SCAA standar",
                iconName: "magnifyingglass"
            )
        }
        .padding()
    }
}
