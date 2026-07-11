import SwiftUI

struct BuyerCheckoutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: KODAMTheme.spacingLG) {
                    
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("Alamat Tujuan")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    // Address Section
                    GlassCard {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Roastery Central, Jakarta")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Text("Jl. Sudirman Kav 12, ID 12190")
                                .font(KODAMFonts.body(.body))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // Product Summary
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("Ringkasan Produk")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        GlassCard {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Gayo Organic")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("Washed")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("Grade 1 Specialty")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: KODAMTheme.spacingMD) {
                                    Circle()
                                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                                        .frame(width: 32, height: 32)
                                        .overlay(Text("-").foregroundStyle(KODAMTheme.textSecondary))
                                    
                                    VStack {
                                        Text("250 kg")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    
                                    Circle()
                                        .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                                        .frame(width: 32, height: 32)
                                        .overlay(Text("+").foregroundStyle(KODAMTheme.textSecondary))
                                }
                            }
                        }
                    }
                    
                    // Payment Method
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("Metode Pembayaran")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        GlassCard {
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("KoperAI Credit Line")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                        }
                    }
                    
                    // Shipping Options
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                        Text("Opsi Pengiriman")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        GlassCard {
                            HStack {
                                Image(systemName: "box.truck")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("KODAM Logistics")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("Estimasi 2-3 hari")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                                Spacer()
                                Text("Rp 450,000")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                        }
                    }
                    
                    // KoperAI Empowerment
                    GlassCard(padding: 0) {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                Text("Pemberdayaan KoperAI")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                            }
                            
                            Text("Pembelian Anda mendanai infrastruktur komunitas secara langsung.")
                                .font(KODAMFonts.body(.bodySmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            
                            GlassCard {
                                VStack(spacing: KODAMTheme.spacingMD) {
                                    HStack(alignment: .top) {
                                        Text("Subtotal (250kg Gayo Organic)")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Spacer()
                                        Text("Rp 15,000,000")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    
                                    HStack(alignment: .top) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            HStack(alignment: .top) {
                                                Image(systemName: "arrow.turn.down.right")
                                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                                    .font(.caption)
                                                    .padding(.top, 4)
                                                Text("12% Deduksi\nPembiayaan")
                                                    .font(KODAMFonts.heading(.headline))
                                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                            }
                                            Text("Otomatis untuk fasilitas\npengering KOP-GAYO")
                                                .font(KODAMFonts.body(.captionSmall))
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                        Spacer()
                                        Text("- Rp 1,800,000")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                    }
                                }
                            }
                        }
                        .padding(KODAMTheme.spacingLG)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                            .strokeBorder(KODAMTheme.emeraldGreen, lineWidth: 2) // Green border on left visually, we'll do full border or just left side later
                    )
                    
                    // Payment Details
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                        Text("Rincian Pembayaran")
                            .font(KODAMFonts.heading(.title3))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        VStack(spacing: KODAMTheme.spacingSM) {
                            summaryRow(title: "Subtotal Pesanan", value: "Rp 15,000,000")
                            summaryRow(title: "Subtotal Pengiriman", value: "Rp 450,000")
                            summaryRow(title: "Biaya Layanan", value: "Rp 25,000")
                            summaryRow(title: "Deduksi Pembiayaan", value: "- Rp 1,800,000", color: KODAMTheme.emeraldGreen)
                        }
                        
                        Divider()
                            .background(KODAMTheme.cardBorder)
                        
                        HStack {
                            Text("Total Pembayaran")
                                .font(KODAMFonts.heading(.headline))
                                .foregroundStyle(KODAMTheme.textPrimary)
                            Spacer()
                            Text("Rp 13,675,000")
                                .font(KODAMFonts.heading(.title2))
                                .foregroundStyle(KODAMTheme.textPrimary)
                        }
                    }
                    .padding(KODAMTheme.spacingLG)
                    .background(KODAMTheme.cardWhite.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                    .overlay(
                        RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                            .strokeBorder(KODAMTheme.cardBorder, lineWidth: 1)
                    )
                    
                    Spacer(minLength: 120) // space for bottom bar
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingLG)
            }
            
            // Bottom Sticky Bar
            VStack {
                KODAMButton("Konfirmasi & Bayar", icon: "lock.fill") {
                    // Payment Action
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(KODAMTheme.warmIvory.opacity(0.95))
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .font(KODAMFonts.heading(.headline))
                }
            }
        }
    }
    
    private func summaryRow(title: String, value: String, color: Color = KODAMTheme.textSecondary) -> some View {
        HStack {
            Text(title)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(color == KODAMTheme.emeraldGreen ? color : KODAMTheme.textSecondary)
            Spacer()
            Text(value)
                .font(KODAMFonts.body(.body))
                .foregroundStyle(color == KODAMTheme.emeraldGreen ? color : KODAMTheme.textPrimary)
        }
    }
}

#Preview {
    NavigationView {
        BuyerCheckoutView()
    }
}
