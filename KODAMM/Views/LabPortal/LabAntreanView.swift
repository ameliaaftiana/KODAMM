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
                            Text("Antrean Pengajuan")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)
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
                        .padding(.bottom, KODAMTheme.spacing3XL)
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
