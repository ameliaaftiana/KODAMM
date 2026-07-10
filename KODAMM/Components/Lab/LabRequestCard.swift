import SwiftUI

// MARK: - Lab Request Card
struct LabRequestCard: View {
    let request: LabRequest

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Image Header with Badge
                ZStack(alignment: .bottomLeading) {
                    Image(request.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                        .cornerRadius(KODAMTheme.radiusSM)

                    // Fallback if image fails or missing
                    if UIImage(named: request.imageName) == nil {
                        LinearGradient(
                            colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 120)
                        .cornerRadius(KODAMTheme.radiusSM)
                    }

                    Text(request.reqNumber)
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background(KODAMTheme.cardWhite.opacity(0.9))
                        .cornerRadius(4)
                        .padding(KODAMTheme.spacingSM)
                }

                // Title and Date
                VStack(alignment: .leading, spacing: 2) {
                    Text(request.title)
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)

                    Text("Diajukan: \(request.dateSubmitted)")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textTertiary)
                }

                // Details Grid
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        detailRow(title: "Koperasi Asal", value: request.cooperative)
                        detailRow(title: "Jumlah Sampel", value: request.sampleWeight)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        detailRow(title: "Varietas", value: request.variety)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Jenis Pengujian")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                                .fontWeight(.bold)
                            
                            HStack(spacing: 4) {
                                ForEach(request.testTypes, id: \.self) { type in
                                    Text(type)
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                        .padding(.horizontal, 6)
                                        .padding(.vertical, KODAMTheme.spacingXS)
                                        .background(KODAMTheme.warmIvory)
                                        .cornerRadius(4)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.top, KODAMTheme.spacingXS)

                // Action Button
                Button(action: {
                    // Action for Terima
                }) {
                    Text("Terima")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, KODAMTheme.spacingSM)
                        .background(KODAMTheme.espressoAccent)
                        .cornerRadius(KODAMTheme.radiusMD)
                }
                .padding(.top, KODAMTheme.spacingSM)
            }
        }
    }

    private func detailRow(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textSecondary)
                .fontWeight(.bold)
            Text(value)
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        LabRequestCard(request: SampleData.labRequests[0])
            .padding()
    }
}
