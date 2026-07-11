import SwiftUI

struct ContentView: View {
    @State private var loggedInRole: AppRole? = nil
    
    var body: some View {
        Group {
            if let role = loggedInRole {
                switch role {
                case .buyer:
                    UserPortalMainView()
                case .cooperative:
                    CooperativePortalMainView()
                case .member:
                    MemberPortalMainView()
                case .lab:
                    LabPortalMainView()
                }
            } else {
                LoginView(loggedInRole: $loggedInRole)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("Logout"))) { _ in
            loggedInRole = nil
        }
    }
}

#Preview {
    ContentView()
}
