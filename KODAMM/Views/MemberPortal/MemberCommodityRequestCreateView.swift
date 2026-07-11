import SwiftUI

struct MemberCommodityRequestCreateView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var variety = ""
    @State private var quantity = ""
    @State private var processType = ""
    @State private var description = ""
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Text("Minta Bantuan Jual")
                            .font(KODAMFonts.heading(.title2))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        Spacer()
                        KODAMButton("Batal", style: .secondary, isFullWidth: false) {
                            dismiss()
                        }
                    }
                    .padding()
                    .background(KODAMTheme.cardWhite.opacity(0.8))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: KODAMTheme.spacingLG) {
                            
                            GlassCard(padding: KODAMTheme.spacingLG) {
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Varietas")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextField("Contoh: Arabica Gayo", text: $variety)
                                            .padding()
                                            .background(KODAMTheme.cardWhite.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Kuantitas (Kg)")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextField("Contoh: 50", text: $quantity)
                                            .keyboardType(.numberPad)
                                            .padding()
                                            .background(KODAMTheme.cardWhite.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Jenis Proses")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextField("Contoh: Full Washed", text: $processType)
                                            .padding()
                                            .background(KODAMTheme.cardWhite.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Deskripsi Tambahan")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextEditor(text: $description)
                                            .frame(height: 100)
                                            .padding(KODAMTheme.spacingXS)
                                            .background(KODAMTheme.cardWhite.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    // Picture Upload Section
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Unggah Foto Komoditas")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        
                                        Button {
                                            // Action for image picker
                                        } label: {
                                            VStack(spacing: KODAMTheme.spacingSM) {
                                                Image(systemName: "camera.fill")
                                                    .font(KODAMFonts.heading(.largeTitle))
                                                    .foregroundStyle(KODAMTheme.textSecondary)
                                                Text("Tap untuk memilih foto")
                                                    .font(KODAMFonts.body(.bodySmall))
                                                    .foregroundStyle(KODAMTheme.textSecondary)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 120)
                                            .background(KODAMTheme.cardWhite.opacity(0.5))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                                                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                                    .foregroundStyle(KODAMTheme.textSecondary)
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                        }
                                    }
                                }
                            }
                            
                            KODAMButton("Kirim Permintaan", icon: "paperplane.fill") {
                                dismiss()
                            }
                        }
                        .padding(KODAMTheme.spacingLG)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MemberCommodityRequestCreateView()
}
