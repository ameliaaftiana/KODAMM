import SwiftUI

struct MemberCommodityRequestCreateView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var variety = "Arabica Gayo"
    @State private var quantity = ""
    @State private var processType = "Washed"
    @State private var description = ""
    
    let varieties = ["Arabica Gayo", "Arabica Toraja", "Robusta Dampit", "Robusta Lampung"]
    let processes = ["Washed", "Natural", "Honey", "Semi-Washed"]
    
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
                        Button("Batal") {
                            dismiss()
                        }
                        .font(KODAMFonts.body(.body).weight(.semibold))
                        .foregroundStyle(KODAMTheme.oliveGreen)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: KODAMTheme.spacingLG) {
                            
                            GlassCard(padding: KODAMTheme.spacingLG) {
                                VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Varietas Kopi")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Picker("Varietas", selection: $variety) {
                                            ForEach(varieties, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(Color.white.opacity(0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Kuantitas (Kg)")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextField("Contoh: 50", text: $quantity)
                                            .keyboardType(.numberPad)
                                            .padding()
                                            .background(Color.white.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Jenis Proses")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Picker("Proses", selection: $processType) {
                                            ForEach(processes, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(Color.white.opacity(0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Deskripsi Tambahan")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        TextEditor(text: $description)
                                            .frame(height: 100)
                                            .padding(4)
                                            .background(Color.white.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                    }
                                }
                            }
                            
                            Button {
                                dismiss()
                            } label: {
                                Text("Kirim Permintaan")
                                    .font(KODAMFonts.heading(.headline))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, KODAMTheme.spacingMD)
                                    .background(KODAMTheme.emeraldGreen)
                                    .foregroundStyle(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
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
