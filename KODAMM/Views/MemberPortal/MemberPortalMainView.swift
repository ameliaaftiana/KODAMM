import SwiftUI

struct MemberPortalMainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MemberDashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
                .tag(0)

            MemberCommodityRequestsView()
                .tabItem {
                    Label("Komoditas", systemImage: "leaf.fill")
                }
                .tag(1)

            MemberLoansView()
                .tabItem {
                    Label("Pinjaman", systemImage: "banknote.fill")
                }
                .tag(2)

            MemberProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(3)
        }
        .tint(KODAMTheme.emeraldGreen)
    }
}

#Preview {
    MemberPortalMainView()
}
