import SwiftUI

// MARK: - Lab Test Detail View
struct LabTestDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var aiNote = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            KODAMTheme.warmIvory.ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                    
                    // Header Card
                    GlassCard(padding: KODAMTheme.spacingSM) {
                        HStack(spacing: KODAMTheme.spacingMD) {
                            Image("gayo_beans")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(KODAMTheme.radiusSM)
                                .clipped()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("BATCH #882-A")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .fontWeight(.bold)
                                
                                Text("Kopi Arabika Gayo Natural")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                
                                Text("Panen: 12 Okt 2023")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                            Spacer()
                        }
                    }

                    // Identitas Produk
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("IDENTITAS PRODUK")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        
                        HStack {
                            Text("ID Sertifikat")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Spacer()
                            Text("KODAM-CERT-2024-882A")
                                .font(KODAMFonts.body(.body))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .fontWeight(.semibold)
                        }
                    }

                    // Parameter Kualitas Section
                    HStack {
                        Text("Parameter Kualitas")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Spacer()
                        Button(action: {}) {
                            HStack(spacing: 4) {
                                Image(systemName: "pencil")
                                Text("Edit")
                            }
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        }
                    }

                    // Quality Grid
                    HStack(spacing: KODAMTheme.spacingMD) {
                        // Kadar Air
                        GlassCard(padding: KODAMTheme.spacingMD) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Kadar Air (%)")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .fontWeight(.bold)
                                HStack(alignment: .firstTextBaseline) {
                                    Text("11.2")
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    HStack(spacing: 2) {
                                        Image(systemName: "checkmark.circle")
                                        Text("Optimal")
                                    }
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.destructiveRed) // matching the brown-redish color in the mockup
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }

                        // Densitas
                        GlassCard(padding: KODAMTheme.spacingMD) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Densitas (g/ml)")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .fontWeight(.bold)
                                Text("0.78")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    // Jumlah Cacat
                    GlassCard(padding: KODAMTheme.spacingMD) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Jumlah Cacat per 300g")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                                .fontWeight(.bold)
                            HStack(alignment: .firstTextBaseline, spacing: 4) {
                                Text("3")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("biji")
                                    .font(KODAMFonts.body(.caption))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    // Skor Cupping SCA
                    GlassCard(padding: KODAMTheme.spacingMD) {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Skor Cupping SCA")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .fontWeight(.bold)
                                Text("86.5")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            Spacer()
                            Image(systemName: "cup.and.saucer")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textTertiary.opacity(0.3))
                        }
                    }

                    // Grade Final
                    GlassCard(padding: KODAMTheme.spacingMD) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Grade Final")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                                .fontWeight(.bold)
                            HStack(spacing: KODAMTheme.spacingMD) {
                                Circle()
                                    .fill(KODAMTheme.oliveGreen)
                                    .frame(width: 40, height: 40)
                                    .overlay {
                                        Text("1")
                                            .font(KODAMFonts.heading(.title2))
                                            .foregroundStyle(.white)
                                    }
                                Text("Specialty Grade")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // Sertifikasi Halal
                    HStack(spacing: KODAMTheme.spacingMD) {
                        Rectangle()
                            .fill(KODAMTheme.textSecondary)
                            .frame(width: 4)
                            .cornerRadius(2)

                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack(spacing: KODAMTheme.spacingSM) {
                                Circle()
                                    .fill(KODAMTheme.cardWhite)
                                    .frame(width: 32, height: 32)
                                    .overlay {
                                        Image(systemName: "checkmark.shield")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                Text("Sertifikasi Halal")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            Text("Semua parameter memenuhi standar ketertelusuran dan kebersihan.")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("ID SERTIFIKAT HALAL")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("ID311100088921")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(KODAMTheme.oliveGreen.opacity(0.1))
                            .cornerRadius(KODAMTheme.radiusSM)

                            Text("● Siap Diterbitkan")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.oliveGreen.opacity(0.15))
                                .cornerRadius(KODAMTheme.radiusMD)
                        }
                    }
                    
                    // Unggah Sertifikat
                    Button(action: {}) {
                        VStack(spacing: 8) {
                            Image(systemName: "doc.arrow.up")
                                .font(KODAMFonts.heading(.title2))
                            Text("Unggah Sertifikat (PDF)")
                                .font(KODAMFonts.heading(.headline))
                        }
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, KODAMTheme.spacingLG)
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [4]))
                                .foregroundStyle(KODAMTheme.textTertiary)
                        )
                    }

                    // AI Notes
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("Catatan untuk Asisten AI")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        
                        GlassCard(padding: 0) {
                            TextField("Tambahkan instruksi khusus untuk pembuatan ringkasan naratif...", text: $aiNote, axis: .vertical)
                                .font(KODAMFonts.body(.caption))
                                .lineLimit(3...5)
                                .padding()
                        }
                    }

                    Spacer().frame(height: 100) // Padding for floating button
                }
                .padding()
            }

            // Floating Button
            VStack {
                Button(action: {
                    // Terbitkan Action
                }) {
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                        Text("Terbitkan Sertifikat & Paspor Halal")
                            .font(KODAMFonts.heading(.headline))
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, KODAMTheme.spacingMD)
                    .background(KODAMTheme.oliveGreen)
                    .cornerRadius(KODAMTheme.radiusMD)
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [KODAMTheme.warmIvory.opacity(0.0), KODAMTheme.warmIvory],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
        .navigationTitle("Rincian Hasil Uji")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(KODAMTheme.warmIvory, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        LabTestDetailView()
    }
}
