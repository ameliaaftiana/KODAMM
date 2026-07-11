import SwiftUI

struct MemberLoansView: View {
    @State private var selectedTab = "Pengajuan"
    let tabs = ["Pengajuan", "Diproses", "Selesai"]
    
    // We reuse SampleData.coopLoans. Filtering based on status.
    var filteredLoans: [CoopLoan] {
        switch selectedTab {
        case "Pengajuan":
            return [] // Pengajuan
        case "Diproses":
            return SampleData.coopLoans.filter { $0.status == "Aktif" }
        case "Selesai":
            return [] // Lunas
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Text("Pinjaman Saya")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        Spacer()
                        
                        Button {
                            // Add new loan action
                        } label: {
                            Image(systemName: "plus")
                                .font(KODAMFonts.heading(.title3).weight(.bold))
                                .foregroundStyle(.white)
                                .padding(12)
                                .background(KODAMTheme.oliveGreen)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .padding(.bottom, KODAMTheme.spacingMD)
                    
                    // Tabs
                    TextTabRow(tabs: tabs, selectedTab: $selectedTab, justified: true)
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacingMD)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            if filteredLoans.isEmpty {
                                Text("Tidak ada data pinjaman.")
                                    .font(KODAMFonts.body(.body))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .padding(.top, 40)
                            } else {
                                ForEach(filteredLoans) { loan in
                                    NavigationLink(destination: MemberLoanDetailView(loan: loan)) {
                                        GlassCard(padding: KODAMTheme.spacingMD) {
                                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                                HStack {
                                                    Image(systemName: "banknote.fill")
                                                        .foregroundStyle(KODAMTheme.emeraldGreen)
                                                    
                                                    Text(loan.period)
                                                        .font(KODAMFonts.body(.captionSmall))
                                                        .foregroundStyle(KODAMTheme.textTertiary)
                                                    
                                                    Spacer()
                                                    
                                                    Text(loan.status)
                                                        .font(KODAMFonts.body(.captionSmall))
                                                        .foregroundStyle(loan.status == "Aktif" ? KODAMTheme.amberGold : KODAMTheme.emeraldGreen)
                                                        .padding(.horizontal, 10)
                                                        .padding(.vertical, 4)
                                                        .background((loan.status == "Aktif" ? KODAMTheme.amberGold : KODAMTheme.emeraldGreen).opacity(0.1))
                                                        .clipShape(Capsule())
                                                }
                                                
                                                Divider()
                                                
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        Text("Total Pinjaman")
                                                            .font(KODAMFonts.body(.captionSmall))
                                                            .foregroundStyle(KODAMTheme.textSecondary)
                                                        Text("Rp. 25.000.000")
                                                            .font(KODAMFonts.heading(.headline))
                                                            .foregroundStyle(KODAMTheme.textPrimary)
                                                    }
                                                    Spacer()
                                                    VStack(alignment: .trailing, spacing: 4) {
                                                        Text("Sisa Tagihan")
                                                            .font(KODAMFonts.body(.captionSmall))
                                                            .foregroundStyle(KODAMTheme.textSecondary)
                                                        Text("Rp. 12.500.000")
                                                            .font(KODAMFonts.heading(.headline))
                                                            .foregroundStyle(KODAMTheme.textPrimary)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, 120)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MemberLoansView()
}
