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
                            Text("Sedang Diproses")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
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
                        .padding(.bottom, KODAMTheme.spacing3XL)
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
