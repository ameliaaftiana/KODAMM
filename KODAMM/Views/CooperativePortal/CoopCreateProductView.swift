import SwiftUI

struct CoopCreateProductView: View {
    let request: MemberCommodityRequest
    @Environment(\.dismiss) private var dismiss
    
    // Form fields
    @State private var productTitle = ""
    @State private var productDescription = ""
    @State private var selectedGrade = "Grade 1"
    @State private var selectedPrice: Double? = nil
    
    // CoreML Prediction State
    @State private var isPredicting = true
    @State private var aiRecommendedPrice: Double? = nil
    @State private var predictionError: String? = nil
    
    var body: some View {
        ZStack(alignment: .top) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header (Transparent overlay on image, but for now simple header)
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .padding(KODAMTheme.spacingSM)
                            .background(Circle().fill(KODAMTheme.warmIvory.opacity(0.8)))
                    }
                    Spacer()
                    Text("Jual Produk")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Spacer()
                    Image(systemName: "chevron.left").opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                .zIndex(10)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Hero Image (Placeholder for the item image)
                        Image("gayo_beans") // Assume we use this placeholder
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Source Info
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                SectionHeader(title: "Detail Komoditas")
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Pemilik")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text(request.memberName)
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Kuantitas")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("\(request.quantityKg) kg")
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                }
                                
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Varietas")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text(request.variety)
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Proses")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text(request.processType)
                                            .font(KODAMFonts.body(.body))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                    }
                                }
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Deskripsi")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    
                                    TextEditor(text: $productDescription)
                                        .frame(height: 80)
                                        .padding(KODAMTheme.spacingSM)
                                        .background(KODAMTheme.warmIvory)
                                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                        .overlay(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM).stroke(KODAMTheme.cardBorder, lineWidth: 1))
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // AI Recommendation
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                HStack(spacing: KODAMTheme.spacingSM) {
                                    Image(systemName: "sparkles")
                                        .font(KODAMFonts.heading(.title2))
                                        .foregroundStyle(KODAMTheme.amberGold)
                                    Text("Rekomendasi Harga AI")
                                        .font(KODAMFonts.heading(.title3).weight(.bold))
                                        .foregroundStyle(KODAMTheme.textPrimary)
                                }
                                
                                Text("Berdasarkan **Sertifikat Uji Lab (Grade 1, SCA 84.5)** untuk varietas \(request.variety) dengan proses \(request.processType), AI menyarankan rentang harga premium berikut:")
                                    .font(KODAMFonts.body(.bodySmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .lineSpacing(4)
                                
                                HStack {
                                    if isPredicting {
                                        ProgressView()
                                            .padding(.trailing, KODAMTheme.spacingSM)
                                        Text("AI sedang menganalisis pasar global...")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    } else if let error = predictionError {
                                        Text("Gagal memuat harga AI: \(error)")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(.red)
                                    } else if let price = aiRecommendedPrice {
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text("Harga Optimal")
                                                .font(KODAMFonts.body(.captionSmall))
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                            Text("Rp. \(Int(price).formatted()) / kg")
                                                .font(KODAMFonts.heading(.title2))
                                                .foregroundStyle(KODAMTheme.espressoAccent)
                                        }
                                        
                                        Spacer()
                                        
                                        Button {
                                            selectedPrice = price
                                        } label: {
                                            Text("Terapkan")
                                                .font(KODAMFonts.body(.caption))
                                                .foregroundStyle(KODAMTheme.espressoAccent)
                                                .padding(.horizontal, KODAMTheme.spacingMD)
                                                .padding(.vertical, KODAMTheme.spacingSM)
                                                .background(
                                                    Capsule()
                                                        .fill(KODAMTheme.highlightLight)
                                                )
                                        }
                                    }
                                }
                                .padding(KODAMTheme.spacingMD)
                                .background(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM).fill(KODAMTheme.warmIvory))
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        
                        // Form Fields
                        GlassCard {
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                SectionHeader(title: "Penetapan Harga")
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Harga Jual Final (Rp/kg)")
                                        .font(KODAMFonts.body(.captionSmall))
                                        .foregroundStyle(KODAMTheme.textSecondary)
                                    
                                    TextField("Misal: 92500", value: $selectedPrice, format: .number)
                                        .keyboardType(.decimalPad)
                                        .font(KODAMFonts.body(.body))
                                        .padding()
                                        .background(KODAMTheme.warmIvory)
                                        .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                        .overlay(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM).stroke(KODAMTheme.cardBorder, lineWidth: 1))
                                }
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                    }
                    .padding(.top, KODAMTheme.spacingSM)
                    .padding(.bottom, KODAMTheme.spacing3XL)
                }
            }
            
            // Bottom Bar
            VStack {
                Spacer()
                VStack(spacing: 0) {
                    Divider()
                    HStack {
                        Button {
                            // Publish Action
                        } label: {
                            Text("Publikasikan Lot")
                                .font(KODAMFonts.heading(.headline))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, KODAMTheme.spacingMD)
                                .background(KODAMTheme.primaryColor)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                        }
                    }
                    .padding(KODAMTheme.spacingLG)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .shadow(color: KODAMTheme.obsidianDark.opacity(0.05), radius: 8, x: 0, y: -2)
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .task {
            do {
                isPredicting = true
                let price = try await PricePredictionService.shared.predictCoffeePrice()
                // The ML Model might predict something realistic but if we want to ensure it looks good we might want to round it up
                aiRecommendedPrice = price
            } catch {
                predictionError = error.localizedDescription
            }
            isPredicting = false
        }
    }
}

#Preview {
    CoopCreateProductView(request: SampleData.memberRequests[0])
}
