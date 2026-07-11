import SwiftUI

struct MemberCommodityRequestDetailView: View {
    let request: MemberCommodityRequest
    @Environment(\.dismiss) private var dismiss
    
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
                    Text("Detail Komoditas")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Spacer()
                    Image(systemName: "chevron.left").opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Image
                        Image("gayo_beans") // Placeholder image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Status Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack {
                                    Text("Status Saat Ini")
                                        .font(KODAMFonts.heading(.headline))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                    Spacer()
                                    Text(request.status.rawValue)
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(Color(request.status.colorName))
                                        .padding(.horizontal, KODAMTheme.spacingSM)
                                        .padding(.vertical, KODAMTheme.spacingXS)
                                        .background(Color(request.status.colorName).opacity(0.1))
                                        .clipShape(Capsule())
                                }
                                
                                Text(statusDescription(for: request.status))
                                    .font(KODAMFonts.body(.bodySmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Details Card
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
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
                                    Text("Tanggal Pengajuan")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    Text(request.dateSubmitted)
                                        .font(KODAMFonts.body(.body))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        if request.status == .tested {
                            // View Certificate Button
                            NavigationLink(destination: MemberCertificateDetailView()) {
                                Text("Lihat Sertifikat Lab")
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingMD)
                                    .background(KODAMTheme.emeraldGreen)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
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
    
    private func statusDescription(for status: CommodityRequestStatus) -> String {
        switch status {
        case .pending:
            return "Permintaan Anda sedang menunggu persetujuan dari Koperasi."
        case .approved, .testing:
            return "Komoditas Anda sedang dalam tahap uji laboratorium untuk memastikan kualitas."
        case .tested:
            return "Uji laboratorium selesai! Sertifikat kualitas telah terbit dan siap dijual."
        case .rejected:
            return "Permintaan Anda ditolak."
        }
    }
}

#Preview {
    MemberCommodityRequestDetailView(request: SampleData.memberRequests[0])
}
