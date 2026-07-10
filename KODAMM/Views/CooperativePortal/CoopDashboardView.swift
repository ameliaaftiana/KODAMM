import SwiftUI

struct CoopDashboardView: View {
    @State private var showMembers = false
    @State private var showLoanDetail = false

    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        // Title
                        Text("Dashboard")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingLG)

                        // Main Balance Card
                        GlassCard(padding: KODAMTheme.spacingLG) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                Text("Sisa Saldo RBF")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textSecondary)

                                Text("Rp. 12.500.000")
                                    .font(KODAMFonts.heading(.largeTitle))
                                    .foregroundStyle(KODAMTheme.espressoDark)

                                VStack(spacing: 8) {
                                    HStack {
                                        Text("Progress Pembayaran")
                                            .font(KODAMFonts.body(.bodySmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Spacer()
                                        Text("50% Terbayar")
                                            .font(KODAMFonts.body(.bodySmall).weight(.bold))
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

                        // Metric Cards Row
                        HStack(spacing: KODAMTheme.spacingMD) {
                            GlassCard(padding: KODAMTheme.spacingMD) {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: "waveform.path.ecg")
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                        Text("Arus Kas")
                                            .font(KODAMFonts.body(.bodySmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                    Text("Sehat")
                                        .font(KODAMFonts.heading(.title3))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }

                            GlassCard(padding: KODAMTheme.spacingMD) {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(systemName: "dollarsign.circle")
                                            .foregroundStyle(KODAMTheme.espressoAccent)
                                        Text("Total Modal")
                                            .font(KODAMFonts.body(.bodySmall))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.8)
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                    Text("Rp. 25 Juta")
                                        .font(KODAMFonts.heading(.title3))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Chart Section
                        GlassCard(padding: KODAMTheme.spacingLG) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                                Text("Volume Penjualan vs Repayment RBF")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)

                                BarChartComponent(
                                    data: [
                                        (0.3, false),
                                        (0.5, false),
                                        (0.2, false),
                                        (0.8, false),
                                        (0.4, true)
                                    ],
                                    height: 120
                                )
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Quick Actions (Navigation)
                        VStack(spacing: KODAMTheme.spacingMD) {
                            NavigationLink(destination: CoopCommodityRequestsView()) {
                                HStack {
                                    Image(systemName: "tray.full.fill")
                                    Text("Permintaan Anggota")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }

                            NavigationLink(destination: CoopLoansView()) {
                                HStack {
                                    Image(systemName: "banknote.fill")
                                    Text("Simpan Pinjam")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }

                            NavigationLink(destination: CoopMembersListView()) {
                                HStack {
                                    Image(systemName: "person.3.fill")
                                    Text("Daftar Anggota")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoDark)
                                .padding()
                                .background(KODAMTheme.cardBorder.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacingXXL)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CoopDashboardView()
}
