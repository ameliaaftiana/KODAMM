import SwiftUI

// MARK: - Lab Antrean View (Antrean Pengajuan)
struct LabAntreanView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "chart.bar.doc.horizontal")
                                    .font(KODAMFonts.heading(.title2))
                                Text("KODAM Lab")
                                    .font(KODAMFonts.heading(.title3))
                            }
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.bottom, KODAMTheme.spacingSM)
                            
                            Text("Antrean Pengajuan")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("\(SampleData.labRequests.count) Permintaan Baru")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.oliveGreen.opacity(0.15))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .padding(.top, KODAMTheme.spacingXS)
                        }
                        .padding(.horizontal)
                        .padding(.top)

                        // Search
                        KODAMSearchBar(text: $searchText, placeholder: "Cari nomor pengajuan, koperasi...")
                            .padding(.horizontal)

                        // List of requests
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(SampleData.labRequests) { request in
                                LabRequestCard(request: request)
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
    LabAntreanView()
}
