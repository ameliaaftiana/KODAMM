import SwiftUI

struct CoopLoansView: View {
    @State private var selectedFilter = "Berjalan (42)"
    let filters = [
        FilterOrigin(id: "Berjalan (42)", name: "Berjalan (42)"),
        FilterOrigin(id: "Pengajuan Baru (12)", name: "Pengajuan Baru (12)"),
        FilterOrigin(id: "Selesai", name: "Selesai")
    ]
    
    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Simpan Pinjam")
                        .font(KODAMFonts.heading(.title1))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Text("Ringkasan aktivitas pinjaman anggota koperasi.")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingMD)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        // Summary Cards
                        VStack(spacing: KODAMTheme.spacingMD) {
                            GlassCard {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("PINJAMAN AKTIF")
                                            .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        HStack(alignment: .lastTextBaseline, spacing: 4) {
                                            Text("124")
                                                .font(KODAMFonts.heading(.largeTitle))
                                                .foregroundStyle(KODAMTheme.textPrimary)
                                            Text("Anggota")
                                                .font(KODAMFonts.body(.caption))
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                    }
                                    Spacer()
                                    Image(systemName: "person.2.fill")
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.textTertiary)
                                }
                            }
                            
                            GlassCard {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("TOTAL PINJAMAN")
                                            .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("Rp. 4.2M")
                                            .font(KODAMFonts.heading(.title1))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    Spacer()
                                    Image(systemName: "wallet.pass.fill")
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.textTertiary)
                                }
                            }
                            
                            GlassCard {
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("SISA TAGIHAN")
                                            .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("Rp. 1.8M")
                                            .font(KODAMFonts.heading(.title1))
                                            .foregroundStyle(KODAMTheme.espressoAccent)
                                    }
                                    Spacer()
                                    Image(systemName: "banknote.fill")
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.cardBorder)
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Filters
                        FilterChipRow(filters: filters, selectedFilter: $selectedFilter)
                        
                        // Loan List
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(SampleData.coopLoans) { loan in
                                NavigationLink(destination: CoopLoanDetailView(loan: loan)) {
                                    CoopLoanCard(loan: loan)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacingXL)
                    }
                }
            }
        }
    }
}

#Preview {
    CoopLoansView()
}
