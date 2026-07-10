import SwiftUI

// MARK: - User Profile View
/// User profile and settings page for Buyer / MSME.
/// Shows account info, settings, and Cloud LLM API key configuration.
struct UserProfileView: View {
    @State private var apiKey = ""
    @State private var showAPIKeyField = false

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingXL) {
                        // Profile Header
                        profileHeader

                        // Quick Stats
                        quickStatsRow

                        // Menu Sections
                        menuSection(title: "Akun Saya", items: [
                            MenuItem(icon: "mappin.circle.fill", title: "Alamat Pengiriman", subtitle: "3 alamat tersimpan", color: KODAMTheme.espressoAccent),
                            MenuItem(icon: "creditcard.fill", title: "Metode Pembayaran", subtitle: "Visa •••• 4242", color: KODAMTheme.amberGold),
                            MenuItem(icon: "bell.fill", title: "Notifikasi", subtitle: "Aktif", color: KODAMTheme.emeraldGreen),
                        ])

                        menuSection(title: "AI & Integrasi", items: [
                            MenuItem(icon: "sparkles", title: "Cloud LLM API Key", subtitle: showAPIKeyField ? "Terkonfigurasi" : "Belum diatur", color: KODAMTheme.amberGold),
                            MenuItem(icon: "brain", title: "Apple Foundation Models", subtitle: "Di Perangkat • Aktif", color: KODAMTheme.scientificCyan),
                        ])

                        // API Key Card (toggleable)
                        if showAPIKeyField {
                            apiKeyCard
                        }

                        menuSection(title: "Lainnya", items: [
                            MenuItem(icon: "questionmark.circle.fill", title: "Bantuan & FAQ", subtitle: nil, color: KODAMTheme.textSecondary),
                            MenuItem(icon: "doc.text.fill", title: "Syarat & Ketentuan", subtitle: nil, color: KODAMTheme.textSecondary),
                            MenuItem(icon: "shield.fill", title: "Kebijakan Privasi", subtitle: nil, color: KODAMTheme.textSecondary),
                        ])

                        // Logout
                        Button {
                            // Logout action
                        } label: {
                            Text("Keluar")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.destructiveRed)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingLG)
                                .background(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                        .fill(KODAMTheme.cardWhite)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                        .strokeBorder(KODAMTheme.destructiveRed.opacity(0.3), lineWidth: 1)
                                )
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Version
                        Text("KODAM v1.0.0 • Hackathon Kemenkop 2026")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)

                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Profile Header
    private var profileHeader: some View {
        VStack(spacing: KODAMTheme.spacingMD) {
            // Avatar
            Circle()
                .fill(
                    LinearGradient(
                        colors: [KODAMTheme.amberGold, KODAMTheme.espressoAccent],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 80, height: 80)
                .overlay {
                    Image(systemName: "person.fill")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(.white)
                }
                .shadow(color: KODAMTheme.amberGold.opacity(0.3), radius: 12, x: 0, y: 4)

            VStack(spacing: 4) {
                Text("Ahmad Rizki")
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.textPrimary)

                Text("buyer@kodam.id")
                    .font(KODAMFonts.body(.bodySmall))
                    .foregroundStyle(KODAMTheme.textSecondary)

                HStack(spacing: 4) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(KODAMFonts.body(.bodySmall))
                        .foregroundStyle(KODAMTheme.amberGold)
                    Text("Pembeli Terverifikasi")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.amberGold)
                }
            }
        }
        .padding(.top, KODAMTheme.spacingXXL)
    }

    // MARK: - Quick Stats
    private var quickStatsRow: some View {
        HStack(spacing: KODAMTheme.spacingMD) {
            statCard(value: "12", label: "Pesanan")
            statCard(value: "3", label: "Koperasi")
            statCard(value: "Rp. 123 Jt", label: "Total Beli")
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
    }

    private func statCard(value: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(KODAMFonts.heading(.title2))
                .foregroundStyle(KODAMTheme.espressoAccent)
            Text(label)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, KODAMTheme.spacingMD)
        .glassCard(cornerRadius: KODAMTheme.radiusMD)
    }

    // MARK: - Menu Section
    struct MenuItem {
        let icon: String
        let title: String
        let subtitle: String?
        let color: Color
    }

    private func menuSection(title: String, items: [MenuItem]) -> some View {
        VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
            Text(title)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textTertiary)
                .textCase(.uppercase)
                .padding(.horizontal, KODAMTheme.spacingLG)

            GlassCard(padding: 0) {
                VStack(spacing: 0) {
                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                        Button {
                            if item.title.contains("API Key") {
                                withAnimation { showAPIKeyField.toggle() }
                            }
                        } label: {
                            HStack(spacing: KODAMTheme.spacingMD) {
                                Image(systemName: item.icon)
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(item.color)
                                    .frame(width: 28, height: 28)

                                VStack(alignment: .leading, spacing: 1) {
                                    Text(item.title)
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    if let subtitle = item.subtitle {
                                        Text(subtitle)
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textTertiary)
                                    }
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textTertiary)
                            }
                            .padding(.horizontal, KODAMTheme.spacingLG)
                            .padding(.vertical, KODAMTheme.spacingMD)
                        }
                        .buttonStyle(.plain)

                        if index < items.count - 1 {
                            Divider()
                                .padding(.leading, 60)
                        }
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
        }
    }

    // MARK: - API Key Card
    private var apiKeyCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                HStack(spacing: KODAMTheme.spacingSM) {
                    Image(systemName: "key.fill")
                        .foregroundStyle(KODAMTheme.amberGold)
                    Text("Gemini API Key (MVP)")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                }

                Text("Masukkan API key untuk fitur Cloud AI lanjutan pada \"Tanyakan pada AI\".")
                    .font(KODAMFonts.body(.bodySmall))
                    .foregroundStyle(KODAMTheme.textSecondary)

                SecureField("AIza...", text: $apiKey)
                    .font(KODAMFonts.mono(.caption))
                    .padding(KODAMTheme.spacingMD)
                    .background(
                        RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                            .fill(KODAMTheme.warmIvory)
                    )

                Button {
                    // Save API key
                } label: {
                    Text("Simpan")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, KODAMTheme.spacingMD)
                        .background(
                            RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                .fill(KODAMTheme.espressoAccent)
                        )
                }
            }
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
        .transition(.opacity.combined(with: .move(edge: .top)))
    }
}

#Preview {
    UserProfileView()
}
