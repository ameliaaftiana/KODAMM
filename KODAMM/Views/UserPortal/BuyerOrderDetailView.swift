import SwiftUI

struct BuyerOrderDetailView: View {
    let order: Order
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: KODAMTheme.spacingLG) {
                    
                    // Shipping Status Card
                    GlassCard {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Estimasi Tiba: 12 Okt")
                                        .font(KODAMFonts.heading(.title2))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    HStack(spacing: 4) {
                                        Text("Status:")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("Dalam Perjalanan")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.espressoAccent)
                                    }
                                }
                                Spacer()
                                Image(systemName: "box.truck.fill")
                                    .foregroundStyle(KODAMTheme.espressoAccent)
                                    .font(KODAMFonts.heading(.title2))
                            }
                            
                            // Progress Bar
                            VStack(spacing: 8) {
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        Capsule()
                                            .fill(KODAMTheme.cardBorder)
                                            .frame(height: 6)
                                        Capsule()
                                            .fill(KODAMTheme.espressoAccent)
                                            .frame(width: geometry.size.width * 0.66, height: 6)
                                    }
                                }
                                .frame(height: 6)
                                
                                HStack {
                                    Text("Dikemas")
                                        .font(KODAMFonts.body(.captionSmall).weight(.medium))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Spacer()
                                    Text("Dikirim")
                                        .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                        .foregroundStyle(KODAMTheme.espressoAccent)
                                    Spacer()
                                    Text("Diterima")
                                        .font(KODAMFonts.body(.captionSmall).weight(.medium))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                }
                            }
                        }
                    }
                    
                    // Order Info
                    GlassCard {
                        VStack(spacing: KODAMTheme.spacingMD) {
                            summaryRow(title: "Nomor Pesanan", value: "KD-8823", trailingIcon: "doc.on.doc")
                            summaryRow(title: "Tanggal Pemesanan", value: "10 Okt 2024")
                            summaryRow(title: "Waktu Pembayaran", value: "10 Okt 2024, 14:20 WIB")
                        }
                    }
                    
                    // Shipping Info
                    GlassCard {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "mappin.circle")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("Info Pengiriman")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                HStack {
                                    Text("KODAM Logistics")
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Text("RESI-KD12345678")
                                        .font(KODAMFonts.body(.captionSmall).weight(.bold))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(KODAMTheme.cardBorder)
                                        .clipShape(Capsule())
                                }
                                Text("Roastery Central, Jakarta\nJl. Sudirman Kav 12, ID 12190")
                                    .font(KODAMFonts.body(.bodySmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .lineSpacing(4)
                            }
                            .padding(KODAMTheme.spacingMD)
                            .background(KODAMTheme.cardWhite.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                    }
                    
                    // Validasi Kualitas
                    GlassCard {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "checkmark.seal")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("Validasi Kualitas")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            Text("Scan kode pada kemasan untuk verifikasi keaslian dan data lab.")
                                .font(KODAMFonts.body(.bodySmall))
                                .foregroundStyle(KODAMTheme.textSecondary)
                            
                            KODAMButton("Scan & Cek Kualitas", icon: "qrcode.viewfinder") {
                                // Scan action
                            }
                        }
                    }
                    
                    // Produk
                    GlassCard {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "shippingbox")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("Produk")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            HStack(alignment: .top, spacing: KODAMTheme.spacingMD) {
                                Image("gayo_beans")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Gayo Organic Washed")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    HStack {
                                        Text("Grade:")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("Specialty A")
                                            .font(KODAMFonts.body(.captionSmall).weight(.medium))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(KODAMTheme.cardBorder)
                                            .clipShape(Capsule())
                                    }
                                    
                                    HStack {
                                        Text("250 kg x Rp 120.000")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Spacer()
                                        Text("Rp 30.000.000")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    .padding(.top, 4)
                                }
                            }
                        }
                    }
                    
                    // Rincian Pembayaran
                    GlassCard {
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "doc.plaintext")
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("Rincian Pembayaran")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            VStack(spacing: KODAMTheme.spacingSM) {
                                summaryRow(title: "Total Harga (250 kg)", value: "Rp 30.000.000")
                                summaryRow(title: "Biaya Pengiriman", value: "Rp 1.500.000")
                                summaryRow(title: "Biaya Layanan", value: "Rp 150.000")
                            }
                            
                            Divider()
                            
                            HStack {
                                Text("Total Belanja")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                Spacer()
                                Text("Rp 31.650.000")
                                    .font(KODAMFonts.heading(.title3))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            // Metode Pembayaran Inset
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundStyle(KODAMTheme.espressoAccent)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Metode Pembayaran")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Text("KoperAI Credit Line")
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                            }
                            .padding(KODAMTheme.spacingMD)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(KODAMTheme.cardWhite.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                    }
                    
                    Spacer(minLength: 120)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.top, KODAMTheme.spacingLG)
            }
            
            // Bottom Action Bar
            VStack {
                HStack(spacing: KODAMTheme.spacingMD) {
                    KODAMButton("Chat\nPenjual", icon: "message", style: .outline) {
                        
                    }
                    KODAMButton("Hubungi\nCS", icon: "headphones") {
                        
                    }
                }
            }
            .padding(.horizontal, KODAMTheme.spacingLG)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(KODAMTheme.warmIvory.opacity(0.95))
        }
        .navigationTitle("Rincian Pesanan")
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
    
    private func summaryRow(title: String, value: String, trailingIcon: String? = nil) -> some View {
        HStack {
            Text(title)
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textSecondary)
            Spacer()
            Text(value)
                .font(KODAMFonts.body(.bodySmall))
                .foregroundStyle(KODAMTheme.textPrimary)
            if let icon = trailingIcon {
                Image(systemName: icon)
                    .foregroundStyle(KODAMTheme.textSecondary)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    NavigationView {
        BuyerOrderDetailView(order: SampleData.orders[0])
    }
}
