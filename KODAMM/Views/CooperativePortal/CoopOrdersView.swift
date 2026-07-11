import SwiftUI

struct CoopOrdersView: View {
    @State private var selectedTab = "Baru"
    let tabs = ["Baru", "Diproses", "Selesai"]

    // Mock filtering based on tab
    var filteredOrders: [CoopOrder] {
        switch selectedTab {
        case "Baru":
            return SampleData.coopOrders.filter { $0.status == .inTransit }
        case "Diproses":
            return SampleData.coopOrders.filter { $0.status == .processing }
        case "Selesai":
            return SampleData.coopOrders.filter { $0.status == .completed }
        default:
            return []
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                VStack(spacing: 0) {
                    // Title
                Text("Pesanan")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    // Text Tab Row
                    TextTabRow(
                        tabs: tabs,
                        selectedTab: $selectedTab,
                        justified: true
                    )
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingMD)
                    .padding(.bottom, KODAMTheme.spacingSM)

                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            if filteredOrders.isEmpty {
                                VStack(spacing: 16) {
                                    Image(systemName: "tray")
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.cardBorder)
                                    Text("Tidak ada pesanan \(selectedTab.lowercased())")
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                .padding(.top, KODAMTheme.spacing3XL)
                            } else {
                                ForEach(filteredOrders) { order in
                                    CoopOrderCard(order: order)
                                }
                            }
                        }
                        .padding(KODAMTheme.spacingLG)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CoopOrdersView()
}
