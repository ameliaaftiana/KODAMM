import SwiftUI

struct MemberDashboardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Header Profile
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Halo, Budi!")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("Petani Kopi • ID: KOP-2023-001")
                                    .font(KODAMFonts.body(.bodySmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                            Spacer()
                            Circle()
                                .fill(KODAMTheme.cardBorder)
                                .frame(width: 50, height: 50)
                                .overlay {
                                    Image(systemName: "person.circle.fill")
                                        .font(.largeTitle)
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.top, KODAMTheme.spacingLG)
                        
                        // Financial Metric
                        GlassCard(padding: KODAMTheme.spacingLG) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack {
                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                        .foregroundStyle(KODAMTheme.emeraldGreen)
                                    Text("Total Pendapatan (Tahun Ini)")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                
                                Text("Rp. 35.500.000")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.espressoDark)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Active Loan Metric
                        GlassCard(padding: KODAMTheme.spacingLG) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack {
                                    Text("Pinjaman Aktif")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Spacer()
                                    Text("Rp. 5.000.000")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.amberGold)
                                }
                                
                                VStack(spacing: 8) {
                                    HStack {
                                        Text("Sisa: Rp. 2.500.000")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Spacer()
                                        Text("50% Lunas")
                                            .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                    }
                                    
                                    // Progress Bar
                                    GeometryReader { geometry in
                                        ZStack(alignment: .leading) {
                                            Capsule()
                                                .fill(KODAMTheme.cardBorder)
                                                .frame(height: 8)
                                            Capsule()
                                                .fill(KODAMTheme.emeraldGreen)
                                                .frame(width: geometry.size.width * 0.5, height: 8)
                                        }
                                    }
                                    .frame(height: 8)
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Recent Activity (Quick Links)
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            Text("Aktivitas Terakhir")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingLG)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: KODAMTheme.spacingMD) {
                                    activityCard(title: "Permintaan Jual", subtitle: "Arabica Gayo - Sedang Uji Lab", icon: "flask.fill", color: KODAMTheme.scientificCyan)
                                    activityCard(title: "Pembayaran Pinjaman", subtitle: "Berhasil - Rp 1.000.000", icon: "checkmark.circle.fill", color: KODAMTheme.emeraldGreen)
                                }
                                .padding(.horizontal, KODAMTheme.spacingLG)
                            }
                        }
                        
                        Spacer(minLength: 40)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func activityCard(title: String, subtitle: String, icon: String, color: Color) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(color)
                    .padding(8)
                    .background(color.opacity(0.1))
                    .clipShape(Circle())
                
                Text(title)
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(KODAMTheme.textPrimary)
                
                Text(subtitle)
                    .font(KODAMFonts.body(.captionSmall))
                    .foregroundStyle(KODAMTheme.textSecondary)
                    .lineLimit(2)
            }
            .frame(width: 160, alignment: .leading)
        }
    }
}

#Preview {
    MemberDashboardView()
}
