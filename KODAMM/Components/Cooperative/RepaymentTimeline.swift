import SwiftUI

/// Timeline component for loan repayments, matching Image 5.
struct RepaymentTimeline: View {
    let repayments: [RepaymentItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(repayments.enumerated()), id: \.offset) { index, item in
                HStack(alignment: .top, spacing: KODAMTheme.spacingMD) {
                    // Timeline indicator
                    VStack(spacing: 0) {
                        ZStack {
                            Circle()
                                .fill(item.isCompleted ? KODAMTheme.emeraldGreen.opacity(0.2) : KODAMTheme.cardBorder)
                                .frame(width: 24, height: 24)

                            if item.isCompleted {
                                Image(systemName: "checkmark")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                            } else {
                                Circle()
                                    .fill(KODAMTheme.textSecondary)
                                    .frame(width: 8, height: 8)
                            }
                        }

                        if index != repayments.count - 1 {
                            Rectangle()
                                .fill(KODAMTheme.cardBorder)
                                .frame(width: 2)
                                .frame(maxHeight: .infinity)
                        }
                    }

                    // Content
                    VStack(alignment: .leading, spacing: 0) {
                        GlassCard(padding: KODAMTheme.spacingMD) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(item.title)
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)

                                    Text(item.date)
                                        .font(KODAMFonts.mono(.caption))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }

                                Text(item.amount.formattedRupiah())
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, KODAMTheme.spacingLG) // space between cards
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        ScrollView {
            RepaymentTimeline(repayments: SampleData.coopLoans[0].repayments)
                .padding()
        }
    }
}
