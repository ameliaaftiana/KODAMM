import SwiftUI

// MARK: - Lab Dashboard View (Sedang Diproses)
struct LabDashboardView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("KODAM Lab")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            
                            Text("Sedang Diproses")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("• \(SampleData.labProcessingItems.count) Sampel Aktif")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.espressoAccent.opacity(0.1))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .padding(.top, KODAMTheme.spacingXS)
                        }
                        .padding(.horizontal)
                        .padding(.top)

                        // Search
                        KODAMSearchBar(text: $searchText, placeholder: "Cari nomor sampel atau koperasi...")
                            .padding(.horizontal)

                        // List of processing items
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(SampleData.labProcessingItems) { item in
                                NavigationLink(destination: LabTestDetailView()) {
                                    LabProcessingCard(item: item)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 100)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    LabDashboardView()
}
