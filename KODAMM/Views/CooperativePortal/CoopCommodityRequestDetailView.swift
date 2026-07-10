import SwiftUI

struct CoopCommodityRequestDetailView: View {
    let request: MemberCommodityRequest
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLab: String? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                    Text("Detail Permintaan")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Spacer()
                    Image(systemName: "chevron.left").opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Hero Image
                        Image("gayo_beans") // Placeholder image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Main Info Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack {
                                    Circle()
                                        .fill(KODAMTheme.warmIvoryDarker)
                                        .frame(width: 50, height: 50)
                                        .overlay {
                                            Image(systemName: request.memberAvatar)
                                                .font(.title2)
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(request.memberName)
                                            .font(KODAMFonts.heading(.title3))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Text(request.dateSubmitted)
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textTertiary)
                                    }
                                    Spacer()
                                    
                                    Text(request.status.rawValue)
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(Color(request.status.colorName))
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(Color(request.status.colorName).opacity(0.1))
                                        .clipShape(Capsule())
                                }
                                
                                Divider()
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Varietas", value: request.variety)
                                        detailRow(title: "Proses", value: request.processType)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: KODAMTheme.spacingSM) {
                                        detailRow(title: "Kuantitas", value: "\(request.quantityKg) kg", trailing: true)
                                        detailRow(title: "ID Tiket", value: request.id, trailing: true)
                                    }
                                }
                                
                                Divider()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Deskripsi Tambahan")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Text("Mohon bantuannya untuk memproses lot ini secepatnya karena sedang butuh dana segar. Kualitas biji kopi dijamin bagus hasil panen bulan ini.")
                                        .font(KODAMFonts.body(.bodySmall))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                            }
                        }
                        
                        if request.status == .testing {
                            // Lab Selection
                            GlassCard {
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    HStack {
                                        Image(systemName: "flask")
                                            .foregroundStyle(KODAMTheme.scientificCyan)
                                        Text("Pilih Laboratorium")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    
                                    Text("Rekomendasi Lab terdekat berdasarkan jenis kopi:")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    
                                    VStack(spacing: KODAMTheme.spacingSM) {
                                        labRow(name: "Lab KODAM Gayo (Rekomendasi)", estTime: "2 Hari", price: "Rp 50.000 / batch")
                                        labRow(name: "Lab Penguji Kopi Aceh", estTime: "4 Hari", price: "Rp 45.000 / batch")
                                    }
                                    
                                    Button {
                                        // Submit Lab Selection
                                    } label: {
                                        Text("Kirim Sampel")
                                            .font(KODAMFonts.heading(.headline))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, KODAMTheme.spacingMD)
                                            .background(selectedLab == nil ? KODAMTheme.cardBorder : KODAMTheme.emeraldGreen)
                                            .foregroundStyle(selectedLab == nil ? KODAMTheme.textSecondary : .white)
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    .disabled(selectedLab == nil)
                                }
                            }
                        } else if request.status == .tested {
                            // Tested - Ready to sell
                            GlassCard {
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    HStack {
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                        Text("Sertifikat Lab Tersedia")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    
                                    Text("Uji lab telah selesai. Hasil menunjukkan bahwa lot ini memiliki **Grade 1** dengan **Skor SCA 84.5**.")
                                        .font(KODAMFonts.body(.bodySmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    
                                    NavigationLink(destination: CoopCreateProductView(request: request)) {
                                        Text("Jual Sekarang")
                                            .font(KODAMFonts.heading(.headline))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, KODAMTheme.spacingMD)
                                            .background(KODAMTheme.emeraldGreen)
                                            .foregroundStyle(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingMD)
                    .padding(.bottom, 40)
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
    
    private func labRow(name: String, estTime: String, price: String) -> some View {
        Button {
            selectedLab = name
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    HStack {
                        Image(systemName: "clock")
                        Text(estTime)
                        Text("•")
                        Text(price)
                    }
                    .font(KODAMFonts.body(.captionSmall))
                    .foregroundStyle(KODAMTheme.textSecondary)
                }
                
                Spacer()
                
                Image(systemName: selectedLab == name ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(selectedLab == name ? KODAMTheme.emeraldGreen : KODAMTheme.textTertiary)
                    .font(.title3)
            }
            .padding(KODAMTheme.spacingMD)
            .background(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM).fill(selectedLab == name ? KODAMTheme.emeraldGreen.opacity(0.1) : KODAMTheme.warmIvory))
            .overlay(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM).stroke(selectedLab == name ? KODAMTheme.emeraldGreen : KODAMTheme.cardBorder, lineWidth: 1))
        }
    }
}

#Preview {
    CoopCommodityRequestDetailView(request: SampleData.memberRequests[0])
}
