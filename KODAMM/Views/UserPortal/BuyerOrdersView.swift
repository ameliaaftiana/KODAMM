import SwiftUI

// MARK: - Buyer Orders View
/// "Pesanan Saya" page matching reference Image 3.
/// Shows status filter tabs and order cards.
struct BuyerOrdersView: View {
    @State private var selectedTab = "Sedang Proses"
    @State private var showScanner = false

    private let tabs = ["Semua", "Sedang Proses", "Selesai", "Dibatalkan"]

    private var filteredOrders: [Order] {
        switch selectedTab {
        case "Sedang Proses":
            return SampleData.orders.filter { $0.status == .inTransit || $0.status == .processing }
        case "Selesai":
            return SampleData.orders.filter { $0.status == .completed }
        case "Dibatalkan":
            return SampleData.orders.filter { $0.status == .cancelled }
        default:
            return SampleData.orders
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {

                        // Title
                        Text("Pesanan Saya")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingLG)

                        // Status filter tabs
                        TextTabRow(
                            tabs: tabs,
                            selectedTab: $selectedTab
                        )
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Spot Check CTA for completed/in-transit orders
                        if selectedTab == "Selesai" || selectedTab == "Sedang Proses" {
                            GlassCard {
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                    HStack {
                                        Image(systemName: "camera.viewfinder")
                                            .font(KODAMFonts.heading(.title3))
                                            .foregroundStyle(KODAMTheme.espressoAccent)
                                        Text("Spot Check Kualitas (AI)")
                                            .font(KODAMFonts.heading(.headline))
                                        Spacer()
                                    }
                                    
                                    Text("Pesanan sudah tiba? Lakukan pemindaian acak dengan AI untuk verifikasi grade SNI.")
                                        .font(KODAMFonts.body(.bodySmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    
                                    Button {
                                        showScanner = true
                                    } label: {
                                        Text("Lakukan Spot Check (AI Scan)")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, KODAMTheme.spacingMD)
                                            .background(
                                                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                                    .fill(KODAMTheme.espressoAccent)
                                            )
                                    }
                                    .padding(.top, 4)
                                }
                            }
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        }

                        // Order Cards
                        if filteredOrders.isEmpty {
                            emptyStateView
                        } else {
                            LazyVStack(spacing: KODAMTheme.spacingLG) {
                                ForEach(filteredOrders) { order in
                                    OrderCard(order: order)
                                }
                            }
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        }

                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showScanner) {
                BeanQualityScannerView()
            }
        }
    }

    private var emptyStateView: some View {
        VStack(spacing: KODAMTheme.spacingLG) {
            Spacer(minLength: 60)

            Image(systemName: "shippingbox")
                .font(KODAMFonts.heading(.largeTitle))
                .foregroundStyle(KODAMTheme.textTertiary)

            Text("Belum ada pesanan")
                .font(KODAMFonts.heading(.title3))
                .foregroundStyle(KODAMTheme.textSecondary)

            Text("Pesanan Anda akan muncul di sini setelah checkout.")
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textTertiary)
                .multilineTextAlignment(.center)

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, KODAMTheme.spacing3XL)
    }
}

#Preview {
    BuyerOrdersView()
}
