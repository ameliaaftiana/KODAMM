import SwiftUI

// MARK: - Marketplace Feed View
/// Home page for User/Buyer portal matching reference Image 1.
/// Shows custom nav bar, search bar, origin filter chips, and scrollable coffee lot cards.
struct MarketplaceFeedView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "all"
    @State private var selectedLot: CoffeeLot? = nil

    private var filteredLots: [CoffeeLot] {
        var lots = SampleData.coffeeLots

        // Filter by origin
        if selectedFilter != "all" {
            lots = lots.filter { lot in
                lot.originDusun.lowercased().contains(selectedFilter.lowercased())
                    || lot.title.lowercased().contains(selectedFilter.lowercased())
            }
        }

        // Filter by search
        if !searchText.isEmpty {
            lots = lots.filter { lot in
                lot.title.localizedCaseInsensitiveContains(searchText)
                    || lot.originDusun.localizedCaseInsensitiveContains(searchText)
                    || lot.cooperativeCode.localizedCaseInsensitiveContains(searchText)
            }
        }

        return lots
    }

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        // Title
                        Text("Pasar")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.top, KODAMTheme.spacingLG)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // Search Bar
                        KODAMSearchBar(text: $searchText)
                            .padding(.horizontal, KODAMTheme.spacingLG)

                        // Filter Chips
                        FilterChipRow(
                            filters: SampleData.filterOrigins,
                            selectedFilter: $selectedFilter
                        )

                        // Coffee Lot Cards
                        LazyVStack(spacing: KODAMTheme.spacingXL) {
                            ForEach(filteredLots) { lot in
                                NavigationLink(destination: BuyerProductDetailView(lot: lot)) {
                                    CoffeeLotCard(lot: lot)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Bottom padding for tab bar
                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MarketplaceFeedView()
}
