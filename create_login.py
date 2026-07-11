import os

filepath = "/Users/ameliaaftiana/Developer/KODAMM/KODAMM/Views/LoginView.swift"

content = """import SwiftUI

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
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: KODAMTheme.spacingXL) {
                    
                    // App Logo / Title
                    VStack(spacing: 8) {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(KODAMTheme.emeraldGreen)
                        
                        Text("KODAM")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        Text("Koperasi Digital Andal & Mandiri")
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    .padding(.top, 60)
                    
                    // Role Selection
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                        Text("Pilih Peran Anda")
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: KODAMTheme.spacingMD) {
                            ForEach(AppRole.allCases) { role in
                                roleCard(role: role)
                            }
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    
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
                                    .background(Color.white.opacity(0.5))
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
                                    .background(Color.white.opacity(0.5))
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
                                    .padding(.vertical, 16)
                                    .background(KODAMTheme.amberGold)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            }
                            .padding(.top, KODAMTheme.spacingMD)
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    
                    Spacer(minLength: 40)
                }
            }
        }
    }
    
    private func roleCard(role: AppRole) -> some View {
        Button {
            withAnimation {
                selectedRole = role
            }
        } label: {
            VStack(spacing: 12) {
                Image(systemName: role.icon)
                    .font(.system(size: 24))
                    .foregroundStyle(selectedRole == role ? .white : KODAMTheme.textSecondary)
                
                Text(role.rawValue)
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(selectedRole == role ? .white : KODAMTheme.textPrimary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, KODAMTheme.spacingLG)
            .background(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                    .fill(selectedRole == role ? KODAMTheme.emeraldGreen : Color.white.opacity(0.4))
            )
            .overlay(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                    .stroke(selectedRole == role ? KODAMTheme.emeraldGreen : KODAMTheme.cardBorder, lineWidth: 1)
            )
        }
    }
}

#Preview {
    LoginView(loggedInRole: .constant(nil))
}
"""

with open(filepath, "w") as f:
    f.write(content)
print("Created LoginView.swift")
