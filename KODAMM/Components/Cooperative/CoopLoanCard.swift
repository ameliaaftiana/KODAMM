import SwiftUI

struct CoopLoanCard: View {
    let loan: CoopLoan
    
    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                // Header
                HStack {
                    Text("ID: \(loan.id)")
                        .font(KODAMFonts.mono(.caption))
                        .foregroundStyle(KODAMTheme.textSecondary)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background(KODAMTheme.warmIvoryDarker)
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    // Avatar Placeholder
                    Circle()
                        .fill(KODAMTheme.cardBorder)
                        .frame(width: 32, height: 32)
                        .overlay {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                }
                
                Text(loan.borrowerName)
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.textPrimary)
                
                Divider()
                    .padding(.vertical, KODAMTheme.spacingXS)
                
                // Loan Details
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Nominal")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(loan.totalAmount.formattedRupiah())
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("Tenor")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(loan.period)
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }
                
                // Progress Bar
                VStack(spacing: 8) {
                    HStack {
                        Text("Progres Pembayaran")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Spacer()
                        // Calculate percentage based on paid vs total
                        let totalDue = loan.totalAmount
                        let paid = max(0, totalDue - loan.remainingAmount)
                        let percentage = totalDue > 0 ? Int((paid / totalDue) * 100) : 0
                        
                        Text("\(percentage)%")
                            .font(KODAMFonts.body(.captionSmall).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(KODAMTheme.cardBorder)
                                .frame(height: 6)
                            
                            let totalDue = loan.totalAmount
                            let paid = max(0, totalDue - loan.remainingAmount)
                            let ratio = totalDue > 0 ? max(0, min(1, paid / totalDue)) : 0
                            
                            Capsule()
                                .fill(KODAMTheme.oliveGreen)
                                .frame(width: geometry.size.width * CGFloat(ratio), height: 6)
                        }
                    }
                    .frame(height: 6)
                    
                    HStack {
                        Spacer()
                        Text("Sisa: \(loan.remainingAmount.formattedRupiah())")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                }
            }
        }
    }
}
