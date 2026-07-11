import SwiftUI

struct CoopProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Header Profile Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                // Logo and Badges
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                    Image(systemName: "building.2.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .foregroundStyle(KODAMTheme.emeraldGreen)
                                        .background(KODAMTheme.warmIvoryDarker)
                                        .clipShape(Circle())
                                    
                                    HStack(spacing: 8) {
                                        // Badge 1
                                        HStack(spacing: 4) {
                                            Image(systemName: "checkmark.circle")
                                                .foregroundStyle(KODAMTheme.emeraldGreen)
                                            Text("Terverifikasi Kemenkop")
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                        .font(KODAMFonts.body(.captionSmall).weight(.medium))
                                        .padding(.horizontal, KODAMTheme.spacingSM)
                                        .padding(.vertical, KODAMTheme.spacingXS)
                                        .background(KODAMTheme.statusAmber)
                                        .clipShape(Capsule())
                                        
                                        // Badge 2
                                        HStack(spacing: 4) {
                                            Image(systemName: "mappin.circle")
                                            Text("Jawa Barat")
                                        }
                                        .font(KODAMFonts.body(.captionSmall).weight(.medium))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                        .padding(.horizontal, KODAMTheme.spacingSM)
                                        .padding(.vertical, KODAMTheme.spacingXS)
                                        .background(KODAMTheme.cardBorder)
                                        .clipShape(Capsule())
                                    }
                                }
                                
                                // Name and Description
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Koperasi Tani Makmur Sejahtera")
                                        .font(KODAMFonts.heading(.title1).weight(.bold))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    
                                    Text("Koperasi produsen yang berfokus pada pemberdayaan petani lokal, peningkat...")
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                        .lineLimit(2)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        // Status Koperasi
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                Text("Status Koperasi")
                                    .font(KODAMFonts.heading(.title3).weight(.bold))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("Aktif beroperasi dan terdaftar resmi.")
                                    .font(KODAMFonts.body(.body))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                
                                Button {
                                    // Ubah profil
                                } label: {
                                    HStack {
                                        Image(systemName: "square.and.pencil")
                                        Text("Ubah Profil")
                                    }
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingMD)
                                    .background(KODAMTheme.primaryColor)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                }
                                
                                Button {
                                    // Bagikan profil
                                } label: {
                                    HStack {
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Bagikan Profil")
                                    }
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingMD)
                                    .background(KODAMTheme.warmIvoryDarker)
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                            .stroke(KODAMTheme.cardBorder, lineWidth: 1)
                                    )
                                }
                            }
                        }
                        
                        // Identitas Legal
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                                SectionHeader(title: "Identitas Legal")
                                
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    legalRow(label: "Nomor Induk Koperasi (NIK)", value: "1.600.000.000.207")
                                    legalRow(label: "Nomor Induk Berusaha (NIB)", value: "2508250086000")
                                    legalRow(label: "SK Pembentukan", value: "AHU-0000207.AH.01.01.TAHUN 2026")
                                    legalRow(label: "SK Perubahan", value: "AHU-500690.AH.01.29.Tahun.2026")
                                }
                            }
                        }
                        
                        // Rekening Bank
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                                SectionHeader(title: "Rekening Bank")
                                
                                HStack(spacing: KODAMTheme.spacingMD) {
                                    Circle()
                                        .fill(KODAMTheme.cardBorder)
                                        .frame(width: 48, height: 48)
                                        .overlay {
                                            Image(systemName: "wallet.pass")
                                                .foregroundStyle(KODAMTheme.textPrimary)
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Bank Mandiri")
                                            .font(KODAMFonts.body(.caption))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("130-00-1234567-8")
                                            .font(KODAMFonts.heading(.title3))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Text("a.n Koperasi Tani Makmur Sejahtera")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        // Copy action
                                    } label: {
                                        Image(systemName: "doc.on.doc")
                                            .font(KODAMFonts.heading(.title3))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                }
                                .padding(KODAMTheme.spacingMD)
                                .background(KODAMTheme.warmIvoryDarker)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }
                        }
                        
                        // Kontak & Alamat
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                                SectionHeader(title: "Kontak & Alamat")
                                
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    contactRow(icon: "mappin.and.ellipse", text: "Jl. Raya Pertanian No. 45, Desa Sukamaju, Kec. Agribisnis, Kab. Bandung, Jawa Barat 40285")
                                    contactRow(icon: "envelope", text: "kontak@tanimakmur.coop")
                                    contactRow(icon: "phone", text: "+62 812 3456 7890")
                                }
                            }
                        }
                        
                        // Logout
                        KODAMButton("Keluar", icon: "rectangle.portrait.and.arrow.right", style: .destructive) {
                            NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                        }
                        
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.vertical, KODAMTheme.spacingMD)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    private func legalRow(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textSecondary)
            Text(value)
                .font(KODAMFonts.mono(.body))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
    
    @ViewBuilder
    private func contactRow(icon: String, text: String) -> some View {
        HStack(alignment: .top, spacing: KODAMTheme.spacingMD) {
            Image(systemName: icon)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(KODAMTheme.textSecondary)
                .frame(width: 20)
            
            Text(text)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    CoopProfileView()
}
