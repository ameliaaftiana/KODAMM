import SwiftUI

struct CoopLabTestsView: View {
    @State private var selectedTab = "Semua"
    private let tabs = ["Semua", "Diproses", "Selesai"]
    
    var filteredTests: [CoopLabTestItem] {
        if selectedTab == "Semua" {
            return SampleData.coopLabTests
        }
        return SampleData.coopLabTests.filter { $0.status == selectedTab }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Uji Laboratorium")
                            .font(KODAMFonts.heading(.title1))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Text("Pantau status pengujian dan lihat hasil sertifikasi lot.")
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingMD)
                    
                    // Tabs
                    TextTabRow(tabs: tabs, selectedTab: $selectedTab, justified: true)
                        .padding(.top, KODAMTheme.spacingMD)
                    
                    // List
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(filteredTests) { test in
                                labTestCard(test)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.top, KODAMTheme.spacingMD)
                        .padding(.bottom, KODAMTheme.spacing3XL)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func labTestCard(_ test: CoopLabTestItem) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Header
                HStack {
                    Image(systemName: "flask.fill")
                        .foregroundStyle(KODAMTheme.scientificCyan)
                        .padding(KODAMTheme.spacingSM)
                        .background(KODAMTheme.scientificCyan.opacity(0.1))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(test.reqNumber)
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Text(test.dateSubmitted)
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                    }
                    
                    Spacer()
                    
                    Text(test.status)
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(test.status == "Selesai" ? KODAMTheme.emeraldGreen : KODAMTheme.amberGold)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background((test.status == "Selesai" ? KODAMTheme.emeraldGreen : KODAMTheme.amberGold).opacity(0.1))
                        .clipShape(Capsule())
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Varietas")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(test.variety)
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }
                
                if let cert = test.certificate, test.status == "Selesai" {
                    VStack(spacing: KODAMTheme.spacingSM) {
                        HStack {
                            Text("Skor SCA")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            Spacer()
                            Text(String(format: "%.2f", cert.scaTotal))
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }
                        
                        HStack {
                            Text("Moisture")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            Spacer()
                            Text("\(String(format: "%.1f", cert.moisturePercent))%")
                                .font(KODAMFonts.body(.bodySmall))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                        
                        if cert.isHalalCertified {
                            HStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                Text("Halal Certified")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                            }
                        }
                    }
                    .padding(KODAMTheme.spacingSM)
                    .background(KODAMTheme.warmIvoryDarker.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                }
            }
        }
    }
}

#Preview {
    CoopLabTestsView()
}
