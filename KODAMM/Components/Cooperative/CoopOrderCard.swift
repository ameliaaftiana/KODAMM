import SwiftUI

/// Specialized card for cooperative orders, matching Image 2.
struct CoopOrderCard: View {
    let order: CoopOrder

    var body: some View {
        GlassCard(padding: 0) { // Zero padding so image reaches edge
            VStack(alignment: .leading, spacing: 0) {
                // Product Image Banner
                ZStack(alignment: .topTrailing) {
                    Image(order.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 140)
                        .clipped()

                    // Request Date Badge (Req: 24 Okt)
                    Text("Req: \(order.requestDate)")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.espressoDark)
                        .padding(.horizontal, KODAMTheme.spacingSM)
                        .padding(.vertical, KODAMTheme.spacingXS)
                        .background(KODAMTheme.cardBorder.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        .padding(KODAMTheme.spacingMD)
                }
                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))

                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                    // Header Info
                    VStack(alignment: .leading, spacing: 4) {
                        Text(order.productName)
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)

                        Text("ID: \(order.orderNumber)")
                            .font(KODAMFonts.mono(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)

                        Text("Pembeli: \(order.buyerUsername)")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .padding(.top, KODAMTheme.spacingXS)
                    }

                    Divider()

                    // Metrics
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Total Pendapatan")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            Text(order.totalRevenue.formattedRupiah())
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(KODAMTheme.espressoAccent)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Kuantitas")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(KODAMTheme.textSecondary)

                            Text("\(order.quantityKg) kg")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, KODAMTheme.spacingXS)
                    
                    // Deadline Section
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text("Deadline Pengiriman")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            
                        Spacer()
                        
                        Text(order.deadline)
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }

                    if order.status == .inTransit {
                        Button(action: {
                            // Terima action
                        }) {
                            Text("Terima")
                                .font(KODAMFonts.heading(.headline))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingMD)
                                .background(KODAMTheme.primaryColor)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                        .padding(.top, KODAMTheme.spacingSM)
                    } else if order.status == .processing {
                        Button(action: {
                            // Lacak action
                        }) {
                            Text("Lacak")
                                .font(KODAMFonts.heading(.headline))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingMD)
                                .background(KODAMTheme.espressoAccent)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                        .padding(.top, KODAMTheme.spacingSM)
                    }
                }
                .padding(KODAMTheme.spacingLG)
            }
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        CoopOrderCard(order: SampleData.coopOrders[0])
            .padding()
    }
}
