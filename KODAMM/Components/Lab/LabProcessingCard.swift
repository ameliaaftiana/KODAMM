import SwiftUI

// MARK: - Lab Processing Card
struct LabProcessingCard: View {
    let item: LabProcessingItem

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Image Header with Badge
                ZStack(alignment: .bottomLeading) {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                        .cornerRadius(KODAMTheme.radiusSM)

                    if UIImage(named: item.imageName) == nil {
                        LinearGradient(
                            colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 120)
                        .cornerRadius(KODAMTheme.radiusSM)
                    }

                    Text(item.sampleNumber)
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background(KODAMTheme.cardWhite.opacity(0.9))
                        .cornerRadius(4)
                        .padding(KODAMTheme.spacingSM)
                }

                // Title, Menu and Subtitle
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.title)
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .lineLimit(2)

                        Text(item.cooperative)
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Action menu
                    }) {
                        Image(systemName: "ellipsis")
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(KODAMTheme.textTertiary)
                            .padding(.top, KODAMTheme.spacingXS)
                    }
                }

                // Details Row 1
                HStack {
                    detailRow(title: "Varietas", value: item.variety)
                    Spacer()
                    detailRow(title: "Berat", value: item.weight)
                }

                // Details Row 2
                HStack {
                    detailRow(title: "Diajukan", value: item.dateSubmitted)
                    Spacer()
                    detailRow(title: "Diterima", value: item.dateReceived)
                }

                // Status Row
                VStack(alignment: .leading, spacing: 4) {
                    Text("Status: \(item.status)")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .fontWeight(.medium)
                }
                .padding(.top, KODAMTheme.spacingXS)

                // Action Button
                Button(action: {
                    // Action for Update Status
                }) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(KODAMFonts.body(.body))
                        Text("Perbarui Status")
                            .font(KODAMFonts.heading(.headline))
                    }
                    .foregroundStyle(KODAMTheme.cardWhite)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, KODAMTheme.spacingSM)
                    .background(KODAMTheme.primaryColor)
                    .cornerRadius(KODAMTheme.radiusMD)
                }
                .padding(.top, KODAMTheme.spacingXS)
            }
        }
    }

    private func detailRow(title: String, value: String) -> some View {
        HStack(spacing: 4) {
            Text("\(title):")
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textSecondary)
            Text(value)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        LabProcessingCard(item: SampleData.labProcessingItems[0])
            .padding()
    }
}
