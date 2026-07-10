import SwiftUI

// MARK: - Lab Portal Main View
struct LabPortalMainView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            LabDashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
                .tag(0)

            LabAntreanView()
                .tabItem {
                    Label("Antrean Uji", systemImage: "list.clipboard.fill")
                }
                .tag(1)

            LabArsipView()
                .tabItem {
                    Label("Arsip", systemImage: "archivebox.fill")
                }
                .tag(2)

            LabProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(3)
        }
        .tint(KODAMTheme.oliveGreen)
    }
}

#Preview {
    LabPortalMainView()
}
