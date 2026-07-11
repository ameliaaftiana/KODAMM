import SwiftUI

struct CoopLotCard: View {
    let lot: CoffeeLot
    var onMenuTap: (() -> Void)? = nil
    
    var body: some View {
        GlassCard(padding: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Image(lot.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 140)
                    .clipped()
                
                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                    // Header: ID + Badge + Menu
                    HStack {
                        Text(lot.cooperativeCode)
                            .font(KODAMFonts.mono(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        
                        // Status Badge
                        if lot.sniGrade == "Grade 1" {
                            // Representing "VERIFIED"
                            HStack(spacing: 4) {
                                Image(systemName: "checkmark.circle")
                                    .font(KODAMFonts.body(.captionSmall))
                                Text("VERIFIED")
                                    .font(KODAMFonts.body(.captionSmall).weight(.semibold))
                            }
                            .padding(.horizontal, KODAMTheme.spacingSM)
                            .padding(.vertical, KODAMTheme.spacingXS)
                            .background(KODAMTheme.statusAmber)
                            .foregroundStyle(KODAMTheme.statusAmberText)
                            .clipShape(Capsule())
                        } else {
                            // Representing "PROSES"
                            HStack(spacing: 4) {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(KODAMFonts.body(.captionSmall))
                                Text("PROSES")
                                    .font(KODAMFonts.body(.captionSmall).weight(.semibold))
                            }
                            .padding(.horizontal, KODAMTheme.spacingSM)
                            .padding(.vertical, KODAMTheme.spacingXS)
                            .background(KODAMTheme.cardBorder)
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .clipShape(Capsule())
                        }
                        
                        Spacer()
                        
                        Button {
                            onMenuTap?()
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                    }
                    
                    // Title
                    Text(lot.title)
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    // Location & Varietas
                    HStack(spacing: 4) {
                        Image(systemName: "mappin")
                            .font(KODAMFonts.body(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("\(lot.originDusun) • \(lot.processType)")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                    
                    Divider()
                        .padding(.vertical, KODAMTheme.spacingXS)
                    
                    // Stats: Stock and Price
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Stok Tersedia")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            Text("\(lot.availableKg) kg")
                                .font(KODAMFonts.body(.bodyLarge).weight(.semibold))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Harga Dasar")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            HStack(alignment: .bottom, spacing: 2) {
                                Text(lot.pricePerKg.formattedRupiah())
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Text("/kg")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                        }
                    }
                }
                .padding(KODAMTheme.spacingLG)
            }
        }
    }
}

