import SwiftUI

struct MemberProfileView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Title
                    Text("Profil Saya")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.top, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacingMD)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: KODAMTheme.spacingLG) {
                            
                            // Profile Card
                            GlassCard {
                                VStack(spacing: KODAMTheme.spacingMD) {
                                    Circle()
                                        .fill(KODAMTheme.cardBorder)
                                        .frame(width: 80, height: 80)
                                        .overlay {
                                            Image(systemName: "person.circle.fill")
                                                .font(.system(size: 60))
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                    
                                    VStack(spacing: 4) {
                                        Text("Budi Santoso")
                                            .font(KODAMFonts.heading(.title3))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Text("ID: KOP-2023-001")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            // Actions
                            VStack(spacing: KODAMTheme.spacingMD) {
                                actionRow(icon: "person.text.rectangle", title: "Data Pribadi")
                                actionRow(icon: "doc.text.fill", title: "Riwayat Komoditas")
                                actionRow(icon: "creditcard.fill", title: "Rekening Bank")
                                actionRow(icon: "gearshape.fill", title: "Pengaturan")
                            }
                            
                            // Logout Button
                            Button {
                                NotificationCenter.default.post(name: NSNotification.Name("Logout"), object: nil)
                            } label: {
                                Text("Keluar")
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingMD)
                                    .background(Color.red.opacity(0.1))
                                    .foregroundStyle(Color.red)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                            }
                            .padding(.top, KODAMTheme.spacingMD)
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func actionRow(icon: String, title: String) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            HStack(spacing: KODAMTheme.spacingMD) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundStyle(KODAMTheme.emeraldGreen)
                    .frame(width: 24)
                
                Text(title)
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(KODAMTheme.textPrimary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(KODAMTheme.textSecondary)
            }
        }
    }
}

#Preview {
    MemberProfileView()
}
