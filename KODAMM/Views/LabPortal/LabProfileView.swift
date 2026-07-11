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
                        
                        // Header Title
                        HStack {
                            Spacer()
                            Text("KODAM Lab")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Spacer()
                        }
                        .overlay(
                            Button(action: {}) {
                                Image(systemName: "gearshape")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                            , alignment: .trailing
                        )
                        .padding(.horizontal)
                        .padding(.top)

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
                        Button(action: {
                            NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                Text("Keluar")
                                    .font(KODAMFonts.heading(.headline))
                            }
                            .foregroundStyle(KODAMTheme.destructiveRed)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, KODAMTheme.spacingMD)
                            .background(KODAMTheme.cardWhite.opacity(0.8))
                            .overlay(
                                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                    .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                            )
                        }
                        .padding(.horizontal)
                        .padding(.top, KODAMTheme.spacingLG)
                        
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
