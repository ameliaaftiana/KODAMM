import SwiftUI

// MARK: - Buyer Product Detail View
/// Comprehensive product detail page matching reference Image 2.
/// Scrollable content: hero image, lab analysis, AI button, RBF transparency,
/// cooperative info, SCA radar chart, reviews, and sticky purchase bar.
struct BuyerProductDetailView: View {
    let lot: CoffeeLot
    @State private var quantity = 100
    @State private var showAISheet = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .bottom) {
            KODAMTheme.warmIvory
                .ignoresSafeArea()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    // MARK: Hero Image
                    heroImageSection

                    VStack(spacing: KODAMTheme.spacingXL) {
                        // MARK: Lab Analysis Card
                        if let cert = lot.labCertificate {
                            labAnalysisSection(cert)
                        }

                        // MARK: Tanyakan pada AI
                        tanyakanAIButton

                        // MARK: Transparansi RBF
                        rbfTransparencySection

                        // MARK: Cooperative Info
                        cooperativeInfoCard

                        // MARK: Digital Halal
                        if let cert = lot.labCertificate, cert.isHalalCertified {
                            digitalHalalCard(cert)
                        }

                        // MARK: SCA Score
                        if let cert = lot.labCertificate {
                            scaScoreSection(cert)
                        }

                        // MARK: Reviews
                        reviewsSection

                        // Bottom spacing for purchase bar
                        Spacer(minLength: 120)
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                }
            }

            // MARK: Sticky Purchase Bar
            purchaseBar
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(KODAMTheme.warmIvory, for: .navigationBar)
        .sheet(isPresented: $showAISheet) {
            aiSheetContent
        }
    }

    // MARK: - Hero Image Section
    private var heroImageSection: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientMid, KODAMTheme.coffeeGradientEnd],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 280)
                .overlay {
                    // Decorative coffee plant overlay
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "leaf.fill")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(.white.opacity(0.08))
                                .rotationEffect(.degrees(25))
                                .offset(x: 20, y: 20)
                        }
                    }
                }

            // Badges overlay
            HStack(spacing: KODAMTheme.spacingXS) {
                GradeBadge(grade: lot.sniGrade)
                if lot.isHalalCertified {
                    HalalBadge()
                }
            }
            .padding(KODAMTheme.spacingLG)

            // Score overlay
            VStack {
                HStack {
                    Spacer()
                    ScoreBadge(score: lot.cuppingScore)
                }
                Spacer()
            }
            .padding(KODAMTheme.spacingLG)
        }
    }

    // MARK: - Lab Analysis Section
    private func labAnalysisSection(_ cert: LabCertificate) -> some View {
        GlassCard {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Header
                HStack {
                    Text("Analisis\nLaboratorium")
                        .font(KODAMFonts.heading(.title3))
                        .foregroundStyle(KODAMTheme.textPrimary)

                    Spacer()

                    Text(cert.certCode)
                        .font(KODAMFonts.mono(.caption2))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }

                // Metrics Grid
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ], spacing: KODAMTheme.spacingMD) {
                    labMetricCell(
                        label: "KADAR AIR",
                        value: String(format: "%.1f%%", cert.moisturePercent)
                    )
                    labMetricCell(
                        label: "DENSITAS",
                        value: String(format: "%.2f", cert.densityGml)
                    )
                    labMetricCell(
                        label: "DEFECT",
                        value: "\(cert.defectCount)\nbiji/300g"
                    )
                    labMetricCell(
                        label: "SERT. HALAL",
                        value: cert.halalCertificateNumber
                    )
                }

                Divider()

                // AI link
                Button {
                    showAISheet = true
                } label: {
                    HStack(spacing: KODAMTheme.spacingSM) {
                        Image(systemName: "sparkles")
                            .font(KODAMFonts.body(.body))
                            .foregroundStyle(KODAMTheme.amberGold)
                        Text("Tanyakan AI detail sertifikat")
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.espressoAccent)
                    }
                }
            }
        }
    }

    private func labMetricCell(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textTertiary)
            Text(value)
                .font(KODAMFonts.heading(.headline))
                .foregroundStyle(KODAMTheme.textPrimary)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(KODAMTheme.spacingMD)
        .background(
            RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                .fill(KODAMTheme.warmIvory)
        )
    }

    // MARK: - Tanyakan pada AI Button
    private var tanyakanAIButton: some View {
        Button {
            showAISheet = true
        } label: {
            GlassCard(padding: KODAMTheme.spacingMD) {
                HStack(spacing: KODAMTheme.spacingMD) {
                    Image(systemName: "sparkles")
                        .font(KODAMFonts.heading(.title1))
                        .foregroundStyle(KODAMTheme.amberGold)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .fill(KODAMTheme.highlightLight)
                        )

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Tanyakan pada AI")
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Text("Analisis catatan cupping dan rekomendasi roasting...")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .lineLimit(1)
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textTertiary)
                }
            }
        }
        .buttonStyle(.plain)
        .sensoryFeedback(.impact(weight: .light), trigger: showAISheet)
    }

    // MARK: - RBF Transparency Section
    private var rbfTransparencySection: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                SectionHeader(title: "Transparansi RBF")

                Text("Setiap pembelian otomatis terdistribusi melalui Smart Contract KODAM")
                    .font(KODAMFonts.body(.bodySmall))
                    .foregroundStyle(KODAMTheme.textSecondary)

                VStack(spacing: KODAMTheme.spacingSM) {
                    rbfRow(
                        label: "Total Kontribusi RBF",
                        valueLeft: "\(Int(SampleData.rbfInfo.totalContributionPercent))%",
                        valueRight: "\(SampleData.rbfInfo.pricePerKg.formattedRupiah()) / kg"
                    )
                    rbfRow(
                        label: "Hak Petani & Koperasi (\(Int(SampleData.rbfInfo.farmerCooperativeSharePercent))%)",
                        valueLeft: "",
                        valueRight: "\(SampleData.rbfInfo.farmerCooperativeSharePerKg.formattedRupiah()) / kg"
                    )
                    rbfRow(
                        label: "Pelunasan RBF \(SampleData.rbfInfo.rbfRepaymentLabel)",
                        valueLeft: "\(Int(SampleData.rbfInfo.rbfRepaymentPercent))%",
                        valueRight: SampleData.rbfInfo.rbfRepaymentPerKg.formattedRupiah()
                    )
                }
            }
        }
    }

    private func rbfRow(label: String, valueLeft: String, valueRight: String) -> some View {
        HStack {
            Text(label)
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textPrimary)
            Spacer()
            if !valueLeft.isEmpty {
                Text(valueLeft)
                    .font(KODAMFonts.body(.caption))
                    .foregroundStyle(KODAMTheme.textSecondary)
            }
            Text(valueRight)
                .font(KODAMFonts.heading(.headline))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
        .padding(.vertical, KODAMTheme.spacingXS)
    }

    // MARK: - Cooperative Info Card
    private var cooperativeInfoCard: some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            HStack(spacing: KODAMTheme.spacingMD) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [KODAMTheme.emeraldGreen, KODAMTheme.emeraldGreen.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 44, height: 44)
                    .overlay {
                        Image(systemName: "person.2.fill")
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(.white)
                    }

                VStack(alignment: .leading, spacing: 2) {
                    Text("Koperasi Gayo")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    HStack(spacing: 4) {
                        Image(systemName: "mappin")
                            .font(KODAMFonts.body(.captionSmall))
                        Text("Takengon, Aceh Tengah")
                            .font(KODAMFonts.body(.bodySmall))
                    }
                    .foregroundStyle(KODAMTheme.textSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(KODAMTheme.textTertiary)
            }
        }
    }

    // MARK: - Digital Halal Card
    private func digitalHalalCard(_ cert: LabCertificate) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            HStack(spacing: KODAMTheme.spacingMD) {
                RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                    .fill(KODAMTheme.successLight)
                    .frame(width: 44, height: 44)
                    .overlay {
                        Image(systemName: "checkmark.seal.fill")
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.emeraldGreen)
                    }

                VStack(alignment: .leading, spacing: 2) {
                    Text("Digital Halal")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Text(cert.halalCertificateNumber)
                        .font(KODAMFonts.mono(.caption2))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(KODAMFonts.heading(.headline))
                    .foregroundStyle(KODAMTheme.textTertiary)
            }
        }
    }

    // MARK: - SCA Score Section
    private func scaScoreSection(_ cert: LabCertificate) -> some View {
        GlassCard {
            VStack(spacing: KODAMTheme.spacingLG) {
                HStack {
                    HStack(spacing: KODAMTheme.spacingSM) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(KODAMTheme.amberGold)
                        Text("Skor SCA")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }

                    Spacer()

                    Text(String(format: "%.2f", cert.scaTotal))
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.espressoAccent)
                }

                RadarChartView(certificate: cert)
                    .frame(height: 220)
            }
        }
    }

    // MARK: - Reviews Section
    private var reviewsSection: some View {
        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
            HStack {
                HStack(spacing: KODAMTheme.spacingSM) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(KODAMTheme.amberGold)
                    Text("Ulasan & Penilaian")
                        .font(KODAMFonts.heading(.title3))
                        .foregroundStyle(KODAMTheme.textPrimary)
                }

                Spacer()

                Text("4.9")
                    .font(KODAMFonts.heading(.title1))
                    .foregroundStyle(KODAMTheme.textPrimary)
                Text("(24 ulasan)")
                    .font(KODAMFonts.body(.bodySmall))
                    .foregroundStyle(KODAMTheme.textSecondary)
            }

            // Star distribution
            VStack(spacing: 4) {
                ForEach([5, 4, 3, 2, 1], id: \.self) { stars in
                    HStack(spacing: 8) {
                        Text("\(stars)")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .frame(width: 12)

                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(KODAMTheme.warmIvoryDarker)
                                    .frame(height: 6)

                                Capsule()
                                    .fill(KODAMTheme.amberGold)
                                    .frame(width: geo.size.width * starPercentage(stars), height: 6)
                            }
                        }
                        .frame(height: 6)
                    }
                }
            }

            // Review Cards
            ForEach(SampleData.reviews) { review in
                reviewCard(review)
            }

            // See all link
            NavigationLink {
                ProductReviewsRatingsView(reviews: SampleData.reviews)
            } label: {
                HStack {
                    Text("Lihat Semua Ulasan")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.espressoAccent)
                    Image(systemName: "arrow.right")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.espressoAccent)
                }
            }
        }
    }

    private func reviewCard(_ review: CoffeeReview) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                HStack {
                    Circle()
                        .fill(KODAMTheme.warmIvoryDarker)
                        .frame(width: 32, height: 32)
                        .overlay {
                            Text(String(review.reviewerName.prefix(1)))
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }

                    VStack(alignment: .leading, spacing: 1) {
                        Text(review.reviewerName)
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Text(review.reviewerSubtitle)
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                    }

                    Spacer()

                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < Int(review.rating) ? "star.fill" : "star")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.amberGold)
                        }
                    }
                }

                Text(review.text)
                    .font(KODAMFonts.body(.bodySmall))
                    .foregroundStyle(KODAMTheme.textSecondary)
                    .lineLimit(2)
            }
        }
    }

    private func starPercentage(_ stars: Int) -> CGFloat {
        switch stars {
        case 5: return 0.75
        case 4: return 0.18
        case 3: return 0.05
        case 2: return 0.02
        default: return 0.0
        }
    }

    // MARK: - Purchase Bar
    private var purchaseBar: some View {
        VStack(spacing: 0) {
            Divider()

            HStack(spacing: KODAMTheme.spacingLG) {
                // Minimum + Price
                VStack(alignment: .leading, spacing: 4) {
                    Text("MIN. PEMBELIAN")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textTertiary)

                    HStack(spacing: 4) {
                        Text("HARGA /KG")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                        Text(lot.pricePerKg.formattedRupiah())
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }

                Spacer()

                // Quantity stepper
                HStack(spacing: 0) {
                    Button {
                        if quantity > 100 { quantity -= 10 }
                    } label: {
                        Image(systemName: "minus")
                            .font(KODAMFonts.heading(.headline))
                            .frame(width: 32, height: 32)
                    }
                    .tint(KODAMTheme.textPrimary)

                    Text("\(quantity) kg")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .frame(width: 56)

                    Button {
                        quantity += 10
                    } label: {
                        Image(systemName: "plus")
                            .font(KODAMFonts.heading(.headline))
                            .frame(width: 32, height: 32)
                    }
                    .tint(KODAMTheme.textPrimary)
                }
                .background(
                    RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                )

                // Buy button
                Button {
                    // Checkout action
                } label: {
                    Text("Beli Sekarang")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(.white)
                        .padding(.horizontal, KODAMTheme.spacingXL)
                        .padding(.vertical, KODAMTheme.spacingMD)
                        .background(
                            Capsule()
                                .fill(KODAMTheme.espressoAccent)
                        )
                }
                .sensoryFeedback(.impact(weight: .medium), trigger: quantity)
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .shadow(color: KODAMTheme.obsidianDark.opacity(0.05), radius: 8, x: 0, y: -2)
            )
        }
    }

    // MARK: - AI Sheet Content
    private var aiSheetContent: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Header
                        HStack(spacing: KODAMTheme.spacingMD) {
                            Image(systemName: "sparkles")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.amberGold)

                            VStack(alignment: .leading, spacing: 2) {
                                Text("Tanyakan pada AI")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("Powered by Apple Foundation Models")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textTertiary)
                            }
                        }

                        Divider()

                        // AI Summary
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                Text("Ringkasan Analisis")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)

                                Text(lot.labCertificate?.tanyakanPadaAiContext ?? "Tidak ada data sertifikat untuk lot ini.")
                                    .font(KODAMFonts.body(.body))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .lineSpacing(4)
                            }
                        }

                        // Quick prompt chips
                        Text("Tanya lebih lanjut:")
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)

                        FlowLayout(spacing: KODAMTheme.spacingSM) {
                            aiChip("Profil roasting yang cocok?")
                            aiChip("Cocok untuk espresso blend?")
                            aiChip("Berapa lama bisa disimpan?")
                            aiChip("Perbandingan dengan Bajawa?")
                        }
                    }
                    .padding(KODAMTheme.spacingXL)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Tutup") {
                        showAISheet = false
                    }
                    .foregroundStyle(KODAMTheme.espressoAccent)
                }
            }
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }

    private func aiChip(_ text: String) -> some View {
        Button {
            // AI interaction
        } label: {
            Text(text)
                .font(KODAMFonts.body(.caption))
                .foregroundStyle(KODAMTheme.espressoAccent)
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.vertical, KODAMTheme.spacingSM)
                .background(
                    Capsule()
                        .fill(KODAMTheme.highlightLight)
                )
                .overlay(
                    Capsule()
                        .strokeBorder(KODAMTheme.amberGold.opacity(0.3), lineWidth: 1)
                )
        }
    }
}

// MARK: - Simple Flow Layout
struct FlowLayout: Layout {
    let spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = layoutResult(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = layoutResult(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(
                at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y),
                proposal: .unspecified
            )
        }
    }

    private func layoutResult(proposal: ProposedViewSize, subviews: Subviews) -> LayoutResult {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if currentX + size.width > maxWidth, currentX > 0 {
                currentX = 0
                currentY += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: currentX, y: currentY))
            rowHeight = max(rowHeight, size.height)
            currentX += size.width + spacing
        }

        return LayoutResult(
            positions: positions,
            size: CGSize(width: maxWidth, height: currentY + rowHeight)
        )
    }

    struct LayoutResult {
        let positions: [CGPoint]
        let size: CGSize
    }
}

#Preview {
    NavigationStack {
        BuyerProductDetailView(lot: SampleData.coffeeLots[0])
    }
}
