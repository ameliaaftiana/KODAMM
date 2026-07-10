import SwiftUI

struct CoopLoanDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let loan: CoopLoan

    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()

            VStack(spacing: 0) {
                Text("Detail Peminjaman")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        
                        // Borrower Header
                        HStack(spacing: KODAMTheme.spacingMD) {
                            Circle()
                                .fill(KODAMTheme.cardBorder)
                                .frame(width: 56, height: 56)
                                .overlay {
                                    Image(systemName: loan.borrowerAvatar)
                                        .resizable()
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                        .padding(KODAMTheme.spacingMD)
                                }

                            VStack(alignment: .leading, spacing: 4) {
                                Text(loan.borrowerName)
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("Peminjam Aktif")
                                    .font(KODAMFonts.mono(.caption))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                            
                            Spacer()
                            
                            Text(loan.status)
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.emeraldGreen)
                                .padding(.horizontal, KODAMTheme.spacingMD)
                                .padding(.vertical, KODAMTheme.spacingSM)
                                .background(KODAMTheme.emeraldGreen.opacity(0.1))
                                .clipShape(Capsule())
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.top, KODAMTheme.spacingMD)

                        // Loan Balance Card
                        GlassCard(padding: KODAMTheme.spacingLG) {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Sisa Pembayaran")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Text(loan.remainingAmount.formattedRupiah())
                                        .font(KODAMFonts.heading(.largeTitle))
                                        .foregroundStyle(KODAMTheme.espressoDark)
                                    Text("dari Total \(loan.totalAmount.formattedRupiah())")
                                        .font(KODAMFonts.body(.bodySmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                
                                VStack(spacing: 8) {
                                    HStack {
                                        Text("Progress Pembayaran")
                                            .font(KODAMFonts.body(.bodySmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Spacer()
                                        let totalDue = loan.totalAmount
                                        let paid = max(0, totalDue - loan.remainingAmount)
                                        let percentage = totalDue > 0 ? Int((paid / totalDue) * 100) : 0
                                        Text("\(percentage)% Terbayar")
                                            .font(KODAMFonts.body(.bodySmall).weight(.bold))
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                    }

                                    GeometryReader { geometry in
                                        ZStack(alignment: .leading) {
                                            Capsule()
                                                .fill(KODAMTheme.cardBorder)
                                                .frame(height: 8)
                                            let totalDue = loan.totalAmount
                                            let paid = max(0, totalDue - loan.remainingAmount)
                                            let ratio = totalDue > 0 ? max(0, min(1, paid / totalDue)) : 0
                                            Capsule()
                                                .fill(KODAMTheme.emeraldGreen)
                                                .frame(width: geometry.size.width * CGFloat(ratio), height: 8)
                                        }
                                    }
                                    .frame(height: 8)
                                }

                                Divider()

                                VStack(alignment: .leading, spacing: 12) {
                                    HStack(alignment: .top) {
                                        Text("Tujuan")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                            .frame(width: 80, alignment: .leading)
                                        Text(loan.purpose)
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }

                                    HStack(alignment: .top) {
                                        Text("Periode")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                            .frame(width: 80, alignment: .leading)
                                        Text(loan.period)
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Repayment Timeline
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            Text("Riwayat Pembayaran")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingLG)

                            RepaymentTimeline(repayments: loan.repayments)
                                .padding(.horizontal, KODAMTheme.spacingLG)
                        }

                        // Bottom Actions
                        VStack(spacing: KODAMTheme.spacingMD) {
                            Button(action: {
                                // Action Unduh Rekap
                            }) {
                                Text("Unduh Rekap")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.espressoAccent)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingLG)
                                    .background(Color.clear)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                                            .strokeBorder(KODAMTheme.espressoAccent, lineWidth: 1.5)
                                    )
                            }
                        }
                        .padding(KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacingXL)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CoopLoanDetailView(loan: SampleData.coopLoans[0])
}
