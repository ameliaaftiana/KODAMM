import SwiftUI

enum AppRole: String, CaseIterable, Identifiable {
    case buyer = "Buyer"
    case cooperative = "Koperasi"
    case member = "Anggota"
    case lab = "Lab"
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .buyer: return "cart.fill"
        case .cooperative: return "building.2.fill"
        case .member: return "person.2.fill"
        case .lab: return "flask.fill"
        }
    }
}

struct LoginView: View {
    @Binding var loggedInRole: AppRole?
    @State private var selectedRole: AppRole = .buyer
    
    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Title Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Choose your role")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Text("below")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacing3XL)
                    .padding(.bottom, KODAMTheme.spacing3XL)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: KODAMTheme.spacingMD) {
                            ForEach(AppRole.allCases) { role in
                                roleCard(role: role)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                    }
                    
                    // Footer Button
                    VStack {
                        NavigationLink(destination: LoginCredentialsView(loggedInRole: $loggedInRole, selectedRole: selectedRole)) {
                            HStack {
                                Text("Get started")
                                    .font(KODAMFonts.heading(.headline))
                                Image(systemName: "arrow.right")
                                    .font(.headline)
                            }
                            .foregroundStyle(KODAMTheme.cardWhite)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, KODAMTheme.spacingLG)
                            .background(KODAMTheme.espressoDark)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusLG))
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.vertical, KODAMTheme.spacingLG)
                    .background(KODAMTheme.warmIvory) // To avoid transparent scrolling overlap
                }
            }
        }
    }
    
    private func roleCard(role: AppRole) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedRole = role
            }
        } label: {
            HStack(spacing: KODAMTheme.spacingLG) {
                // Large Icon / Illustration substitute
                Image(systemName: role.icon)
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(selectedRole == role ? .white : KODAMTheme.emeraldGreen)
                    .frame(width: 80, height: 80)
                    .background(selectedRole == role ? Color.white.opacity(0.2) : KODAMTheme.oliveGreen.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                
                Text(role.rawValue)
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(selectedRole == role ? .white : KODAMTheme.textPrimary)
                    
                Spacer()
            }
            .padding(KODAMTheme.spacingMD)
            .background(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                    .fill(selectedRole == role ? KODAMTheme.emeraldGreen : KODAMTheme.cardWhite)
            )
            .overlay(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
                    .stroke(selectedRole == role ? KODAMTheme.emeraldGreen : KODAMTheme.cardBorder, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Step 2: Credentials
struct LoginCredentialsView: View {
    @Binding var loggedInRole: AppRole?
    let selectedRole: AppRole
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: KODAMTheme.spacingXL) {
                
                // App Logo / Title
                VStack(spacing: 8) {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(KODAMTheme.emeraldGreen)
                    
                    Text("KODAM")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Text("Masuk sebagai \(selectedRole.rawValue)")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
                .padding(.top, KODAMTheme.spacing3XL)
                
                // Form
                GlassCard {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            TextField("Masukkan email", text: $email)
                                .font(KODAMFonts.body(.body))
                                .padding()
                                .background(KODAMTheme.cardWhite.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                .overlay(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                        .stroke(KODAMTheme.cardBorder, lineWidth: 1)
                                )
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Kata Sandi")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            SecureField("Masukkan kata sandi", text: $password)
                                .font(KODAMFonts.body(.body))
                                .padding()
                                .background(KODAMTheme.cardWhite.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                .overlay(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                        .stroke(KODAMTheme.cardBorder, lineWidth: 1)
                                )
                        }
                        
                        Button {
                            withAnimation {
                                loggedInRole = selectedRole
                            }
                        } label: {
                            Text("Masuk")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingLG)
                                .background(KODAMTheme.amberGold)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                        }
                        .padding(.top, KODAMTheme.spacingMD)
                    }
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView(loggedInRole: .constant(nil))
}
