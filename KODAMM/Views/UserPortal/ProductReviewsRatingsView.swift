import SwiftUI

struct ProductReviewsRatingsView: View {
    let reviews: [CoffeeReview]
    var body: some View {
        ScrollView {
            VStack(spacing: KODAMTheme.spacingLG) {
                
                // Summary Header
                VStack(spacing: KODAMTheme.spacingSM) {
                    Text("4.9")
                        .font(KODAMFonts.heading(.largeTitle))
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundStyle(KODAMTheme.amberGold)
                        }
                    }
                    
                    Text("Berdasarkan 24 ulasan pembeli")
                        .font(KODAMFonts.body(.caption))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
                .padding(.top, KODAMTheme.spacingLG)
                

                
                // Review List
                LazyVStack(spacing: KODAMTheme.spacingMD) {
                    ForEach(reviews) { review in
                        reviewCardFull(review)
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.bottom, 40)
        }
        .background(KODAMTheme.warmIvory.ignoresSafeArea())
        .navigationTitle("Ulasan & Penilaian")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func reviewCardFull(_ review: CoffeeReview) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                HStack {
                    Circle()
                        .fill(KODAMTheme.warmIvoryDarker)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Text(String(review.reviewerName.prefix(1)))
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(review.reviewerName)
                            .font(KODAMFonts.heading(.headline))
                        Text(review.reviewerSubtitle)
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        HStack(spacing: 2) {
                            ForEach(0..<5) { index in
                                Image(systemName: index < Int(review.rating) ? "star.fill" : "star")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.amberGold)
                            }
                        }
                        Text("Bulan lalu")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textTertiary)
                    }
                }
                
                Text(review.text)
                    .font(KODAMFonts.body(.body))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .lineSpacing(4)
                    .padding(.top, 4)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProductReviewsRatingsView(reviews: SampleData.reviews)
    }
}
