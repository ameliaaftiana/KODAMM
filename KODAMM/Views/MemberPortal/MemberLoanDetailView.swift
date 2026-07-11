import SwiftUI

struct MemberLoanDetailView: View {
    let loan: CoopLoan
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                    HStack {
                        Button { dismiss() } label: {
                            Image(systemName: "chevron.left")
                                .font(KODAMFonts.heading(.title3).weight(.bold))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                        Spacer()
                    }
                    
                    Text("Detail Pinjaman")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Main Info Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack {
                                    Text("Status Saat Ini")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Spacer()
                                    Text(loan.status)
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(loan.status == "Aktif" ? KODAMTheme.amberGold : KODAMTheme.emeraldGreen)
                                        .padding(.horizontal, KODAMTheme.spacingSM)
                                        .padding(.vertical, KODAMTheme.spacingXS)
                                        .background((loan.status == "Aktif" ? KODAMTheme.amberGold : KODAMTheme.emeraldGreen).opacity(0.1))
                                        .clipShape(Capsule())
                                }
                                
                                Divider()
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Tujuan Pinjaman", value: loan.purpose)
                                        detailRow(title: "Periode", value: loan.period)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Financial Progress Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Total Pinjaman", value: "Rp. \(loan.totalAmount.formatted())")
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Sisa Tagihan", value: "Rp. \(loan.remainingAmount.formatted())", trailing: true)
                                    }
                                }
                                
                                // Progress Bar
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Capsule()
                                            .fill(KODAMTheme.cardBorder)
                                            .frame(height: 8)
                                        Capsule()
                                            .fill(KODAMTheme.emeraldGreen)
                                            .frame(width: geometry.size.width * 0.5, height: 8) // Hardcoded 50% for mockup
                                    }
                                }
                                .frame(height: 8)
                                .padding(.top, KODAMTheme.spacingXS)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Riwayat Pembayaran
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            Text("Riwayat & Jadwal Pembayaran")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                                .padding(.horizontal, KODAMTheme.spacingLG)
                            
                            VStack(spacing: KODAMTheme.spacingMD) {
                                ForEach(loan.repayments) { item in
                                    GlassCard(padding: KODAMTheme.spacingMD) {
                                        HStack {
                                            Circle()
                                                .strokeBorder(item.isCompleted ? KODAMTheme.emeraldGreen : KODAMTheme.cardBorder, lineWidth: 2)
                                                .background(Circle().fill(item.isCompleted ? KODAMTheme.emeraldGreen : .clear))
                                                .frame(width: 20, height: 20)
                                                .overlay {
                                                    if item.isCompleted {
                                                        Image(systemName: "checkmark")
                                                            .font(KODAMFonts.body(.captionSmall))
                                                            .foregroundStyle(.white)
                                                    }
                                                }
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(item.title)
                                                    .font(KODAMFonts.heading(.headline))
                                                    .foregroundStyle(item.isCompleted ? KODAMTheme.textPrimary : KODAMTheme.textSecondary)
                                                Text(item.date)
                                                    .font(KODAMFonts.body(.captionSmall))
                                                    .foregroundStyle(KODAMTheme.textTertiary)
                                            }
                                            
                                            Spacer()
                                            
                                            Text("Rp. \(item.amount.formatted())")
                                                .font(KODAMFonts.heading(.headline))
                                                .foregroundStyle(item.isCompleted ? KODAMTheme.textPrimary : KODAMTheme.textSecondary)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        }
                    }
                    .padding(.bottom, KODAMTheme.spacing3XL)
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private func detailRow(title: String, value: String, trailing: Bool = false) -> some View {
        VStack(alignment: trailing ? .trailing : .leading, spacing: 4) {
            Text(title)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textSecondary)
            Text(value)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    MemberLoanDetailView(loan: SampleData.coopLoans[0])
}
