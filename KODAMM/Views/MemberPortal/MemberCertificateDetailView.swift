import SwiftUI

struct MemberCertificateDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var chatQuery = ""
    @State private var chatHistory: [(isUser: Bool, text: String)] = [
        (false, "Halo! Berdasarkan sertifikat Anda, lot ini mendapatkan Grade 1 dengan skor 84.5 (Specialty). Apakah ada yang ingin ditanyakan terkait kualitas kopi ini?")
    ]
    
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
                    Text("Sertifikat Lab")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    Spacer()
                    Image(systemName: "chevron.left").opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        
                        // Certificate Card
                        GlassCard {
                            VStack(spacing: KODAMTheme.spacingMD) {
                                Image(systemName: "checkmark.seal.fill")
                                    .font(.system(size: 60))
                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                
                                Text("SERTIFIKAT LULUS UJI")
                                    .font(KODAMFonts.heading(.title3).weight(.bold))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                                
                                Divider()
                                
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Grade SNI")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("Grade 1")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.emeraldGreen)
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Skor SCA")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                        Text("84.5")
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.amberGold)
                                    }
                                }
                            }
                        }
                        
                        // Tanya AI Section
                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                            HStack {
                                Image(systemName: "sparkles")
                                    .foregroundStyle(KODAMTheme.scientificCyan)
                                Text("Tanya AI tentang Sertifikat Anda")
                                    .font(KODAMFonts.heading(.headline))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            // Chat History
                            VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                                ForEach(0..<chatHistory.count, id: \.self) { index in
                                    let message = chatHistory[index]
                                    HStack {
                                        if message.isUser { Spacer() }
                                        Text(message.text)
                                            .font(KODAMFonts.body(.bodySmall))
                                            .padding(10)
                                            .background(message.isUser ? KODAMTheme.emeraldGreen : KODAMTheme.cardBorder)
                                            .foregroundStyle(message.isUser ? .white : KODAMTheme.textPrimary)
                                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                        if !message.isUser { Spacer() }
                                    }
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusMD))
                            
                            // Input Field
                            HStack {
                                TextField("Ketik pertanyaan...", text: $chatQuery)
                                    .font(KODAMFonts.body(.bodySmall))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 10)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                                
                                Button {
                                    if !chatQuery.isEmpty {
                                        chatHistory.append((true, chatQuery))
                                        let query = chatQuery
                                        chatQuery = ""
                                        // Mock AI Response
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            chatHistory.append((false, "Kopi Anda sangat baik! Skor 84.5 masuk kategori Specialty. Anda bisa menjualnya dengan harga lebih tinggi."))
                                        }
                                    }
                                } label: {
                                    Image(systemName: "paperplane.fill")
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background(KODAMTheme.scientificCyan)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MemberCertificateDetailView()
}
