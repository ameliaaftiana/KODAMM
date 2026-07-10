



import SwiftUI

/// Main Tab Navigation for Cooperative Portal
struct CooperativePortalMainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CoopDashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
                .tag(0)

            CoopLotsView()
            .tabItem {
                Label("Kelola Lot", systemImage: "shippingbox.fill")
            }
            .tag(1)

            CoopLabTestsView()
            .tabItem {
                Label("Uji Lab", systemImage: "flask.fill")
            }
            .tag(2)

            CoopOrdersView()
                .tabItem {
                    Label("Pesanan", systemImage: "doc.text.fill")
                }
                .tag(3)

            CoopProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(4)
        }
        .tint(KODAMTheme.emeraldGreen) // Cooperative accent color
    }
}

#Preview {
    CooperativePortalMainView()
}
