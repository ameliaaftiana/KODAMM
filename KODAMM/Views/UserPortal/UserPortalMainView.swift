import SwiftUI

// MARK: - User Portal Main View
/// Main TabView for the User/Buyer portal with 5 tabs.
/// Pasar (Home), Keranjang (Cart), Pesanan (Orders), Pesan (Chat), Profil (Profile)
struct UserPortalMainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MarketplaceFeedView()
                .tabItem {
                    Label("Pasar", systemImage: "storefront.fill")
                }
                .tag(0)

            BuyerCartView()
                .tabItem {
                    Label("Keranjang", systemImage: "cart.fill")
                }
                .tag(1)

            BuyerOrdersView()
                .tabItem {
                    Label("Pesanan", systemImage: "doc.text.fill")
                }
                .tag(2)

            UserChatListView()
                .tabItem {
                    Label("Pesan", systemImage: "message.fill")
                }
                .tag(3)

            UserProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(4)
        }
        .tint(KODAMTheme.espressoAccent)
    }
}

#Preview {
    UserPortalMainView()
}
