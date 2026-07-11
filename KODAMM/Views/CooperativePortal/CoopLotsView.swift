import SwiftUI

struct CoopLotsView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header Area
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Kelola Lot Kopi")
                                .font(KODAMFonts.heading(.title1))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Text("Pantau dan kelola inventaris biji kopi hijau.")
                                .font(KODAMFonts.body(.body))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        KODAMSearchBar(text: $searchText, placeholder: "Cari ID Lot, Nama, atau Varietas...")
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.bottom, KODAMTheme.spacingMD)
                    }
                    .padding(.top, KODAMTheme.spacingMD)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(SampleData.coffeeLots) { lot in
                                NavigationLink(destination: CoopLotDetailView(lot: lot)) {
                                    CoopLotCard(lot: lot)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacing3XL) // Padding for Floating Action Button
                    }
                }
                
                // Floating Action Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: CoopCommodityRequestsView()) {
                            Image(systemName: "plus")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(.white)
                                .frame(width: 60, height: 60)
                                .background(KODAMTheme.primaryColor)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 4)
                        }
                        .padding(KODAMTheme.spacingXL)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CoopLotsView()
}
