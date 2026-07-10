import SwiftUI

// MARK: - Lab Certificate Card
struct LabCertificateCard: View {
    let certificate: LabCertificate
    let coffeeTitle: String
    let cooperative: String
    let weight: String
    let dateIssued: String
    let imageName: String

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Image Header with Badge
                ZStack(alignment: .bottomLeading) {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .clipped()
                        .cornerRadius(KODAMTheme.radiusSM)

                    if UIImage(named: imageName) == nil {
                        LinearGradient(
                            colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 120)
                        .cornerRadius(KODAMTheme.radiusSM)
                    }

                    Text("#\(certificate.certCode.suffix(14))")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background(KODAMTheme.cardWhite.opacity(0.9))
                        .cornerRadius(4)
                        .padding(KODAMTheme.spacingSM)
                }

                // Title and Subtitle
                VStack(alignment: .leading, spacing: 2) {
                    Text(coffeeTitle)
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)

                    Text(cooperative)
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }

                // Scores and Status Row
                HStack(spacing: KODAMTheme.spacingMD) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("SKOR CUPPING")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(String(format: "%.1f", certificate.scaTotal))
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    .padding(.vertical, KODAMTheme.spacingSM)
                    .padding(.horizontal, KODAMTheme.spacingMD)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(KODAMTheme.cardWhite)
                    .cornerRadius(KODAMTheme.radiusSM)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("STATUS")
                            .font(KODAMFonts.mono(.caption2))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Terverifikasi")
                            .font(KODAMFonts.body(.body))
                            .fontWeight(.semibold)
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    .padding(.vertical, KODAMTheme.spacingSM)
                    .padding(.horizontal, KODAMTheme.spacingMD)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(KODAMTheme.cardWhite)
                    .cornerRadius(KODAMTheme.radiusSM)
                }

                // Details
                HStack {
                    Text("Grade: \(certificate.sniGrade)")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textSecondary)
                    Spacer()
                    Text("Berat: \(weight)")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
                
                Divider()

                Text("Terbit: \(dateIssued)")
                    .font(KODAMFonts.body(.caption))
                    .foregroundStyle(KODAMTheme.textTertiary)

                // Action Button
                Button(action: {
                    // Action for Ubah Data
                }) {
                    HStack {
                        Image(systemName: "pencil")
                            .font(KODAMFonts.body(.body))
                        Text("Ubah Data")
                            .font(KODAMFonts.heading(.headline))
                    }
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, KODAMTheme.spacingSM)
                    .background(KODAMTheme.oliveGreen.opacity(0.15))
                    .cornerRadius(KODAMTheme.radiusMD)
                }
                .padding(.top, KODAMTheme.spacingXS)
            }
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        LabCertificateCard(
            certificate: SampleData.gayoCertificate,
            coffeeTitle: "Arabica Gayo",
            cooperative: "Koperasi Tani Makmur",
            weight: "250g",
            dateIssued: "12 Okt 2023",
            imageName: "gayo_beans"
        )
        .padding()
    }
}
