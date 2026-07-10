import SwiftUI

// MARK: - Lab Arsip View (Arsip Sertifikat)
struct LabArsipView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "Semua Grade"
    
    let filters = ["Semua Grade", "Specialty (80+)", "Premium"]

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Header
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "flask")
                                    .font(KODAMFonts.heading(.title2))
                                Text("KODAM Lab")
                                    .font(KODAMFonts.heading(.title3))
                            }
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(.bottom, KODAMTheme.spacingSM)
                            
                            Text("Arsip Sertifikat")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text("156 Sertifikat Terbit")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingXS)
                                .background(KODAMTheme.cardWhite.opacity(0.8))
                                .cornerRadius(KODAMTheme.radiusMD)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                                )
                                .padding(.top, KODAMTheme.spacingXS)
                        }
                        .padding(.horizontal)
                        .padding(.top)

                        // Search
                        KODAMSearchBar(text: $searchText, placeholder: "Cari nomor sertifikat, sampel...")
                            .padding(.horizontal)

                        // Filter Chips
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: KODAMTheme.spacingSM) {
                                ForEach(filters, id: \.self) { filter in
                                    Button(action: {
                                        selectedFilter = filter
                                    }) {
                                        Text(filter)
                                            .font(KODAMFonts.body(.caption))
                                            .foregroundStyle(
                                                selectedFilter == filter
                                                ? .white
                                                : KODAMTheme.textSecondary
                                            )
                                            .padding(.horizontal, KODAMTheme.spacingMD)
                                            .padding(.vertical, KODAMTheme.spacingSM)
                                            .background(
                                                selectedFilter == filter
                                                ? KODAMTheme.oliveGreen
                                                : KODAMTheme.cardWhite
                                            )
                                            .cornerRadius(KODAMTheme.radiusXL)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: KODAMTheme.radiusXL)
                                                    .strokeBorder(
                                                        selectedFilter == filter
                                                        ? Color.clear
                                                        : KODAMTheme.cardBorder,
                                                        lineWidth: 1
                                                    )
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }

                        // List of certificates
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            NavigationLink(destination: LabTestDetailView()) {
                                LabCertificateCard(
                                    certificate: SampleData.gayoCertificate,
                                    coffeeTitle: "Arabica Gayo",
                                    cooperative: "Koperasi Tani Makmur",
                                    weight: "250g",
                                    dateIssued: "12 Okt 2023",
                                    imageName: "gayo_beans"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink(destination: LabTestDetailView()) {
                                LabCertificateCard(
                                    certificate: SampleData.torajaCertificate,
                                    coffeeTitle: "Robusta Dampit",
                                    cooperative: "Kelompok Tani Harapan",
                                    weight: "500g",
                                    dateIssued: "10 Okt 2023",
                                    imageName: "lintong_beans"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            NavigationLink(destination: LabTestDetailView()) {
                                LabCertificateCard(
                                    certificate: SampleData.bajawaCertificate,
                                    coffeeTitle: "Arabica Toraja",
                                    cooperative: "Koperasi Sinar",
                                    weight: "200g",
                                    dateIssued: "05 Okt 2023",
                                    imageName: "toraja_beans"
                                )
                            }
                            .buttonStyle(.plain)
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
    LabArsipView()
}
