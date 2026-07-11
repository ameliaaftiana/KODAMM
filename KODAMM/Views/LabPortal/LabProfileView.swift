import SwiftUI

// MARK: - Lab Profile View
struct LabProfileView: View {
    let columns = [
        GridItem(.flexible(), spacing: KODAMTheme.spacingMD),
        GridItem(.flexible(), spacing: KODAMTheme.spacingMD)
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Profile Header Card
                        GlassCard(padding: KODAMTheme.spacingXL) {
                            VStack(spacing: KODAMTheme.spacingMD) {
                                Image("gayo_beans") // Using existing image as placeholder
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(KODAMTheme.cardWhite, lineWidth: 4)
                                    )
                                    .shadow(color: .black.opacity(0.1), radius: 4)

                                VStack(spacing: 4) {
                                    Text("Lab Uji Kualitas Kopi Nasional")
                                        .font(KODAMFonts.heading(.title2))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("ID: LUK-2024-IDN")
                                        .font(KODAMFonts.body(.caption))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                
                                HStack(spacing: 6) {
                                    Image(systemName: "checkmark.seal.fill")
                                        .font(KODAMFonts.body(.bodySmall))
                                    Text("Terakreditasi KAN: LP-1234-IDN")
                                        .font(KODAMFonts.body(.captionSmall))
                                }
                                .foregroundStyle(KODAMTheme.textSecondary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingSM)
                                .background(KODAMTheme.oliveGreen.opacity(0.15))
                                .cornerRadius(KODAMTheme.radiusLG)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.horizontal)

                        // Parameter Pengujian
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            Text("Parameter Pengujian")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal)

                            LazyVGrid(columns: columns, spacing: KODAMTheme.spacingMD) {
                                LabParameterCard(
                                    title: "Kadar Air",
                                    description: "Analisis kelembaban presisi",
                                    iconName: "drop.fill"
                                )
                                LabParameterCard(
                                    title: "Densitas",
                                    description: "Pengukuran massa jenis biji kopi",
                                    iconName: "scale.3d"
                                )
                                LabParameterCard(
                                    title: "Cacat Fisik",
                                    description: "Identifikasi defect SCAA standar",
                                    iconName: "ladybug.fill"
                                )
                                LabParameterCard(
                                    title: "Cupping",
                                    description: "Evaluasi sensoris & profil rasa",
                                    iconName: "cup.and.saucer.fill"
                                )
                            }
                            .padding(.horizontal)
                        }

                        // Keluar Button
                        KODAMButton("Keluar", icon: "rectangle.portrait.and.arrow.right", style: .destructive) {
                            NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                       
                        
                        Spacer().frame(height: 100)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LabProfileView()
}
