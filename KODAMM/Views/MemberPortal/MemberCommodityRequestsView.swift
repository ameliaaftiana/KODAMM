import SwiftUI

struct MemberCommodityRequestsView: View {
    @State private var showingCreateView = false
    
    // Assume Budi is logged in, so we just show all sample requests for now
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                KODAMTheme.warmIvory.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    HStack {
                        Text("Komoditas Saya")
                            .font(KODAMFonts.heading(.largeTitle))
                            .foregroundStyle(KODAMTheme.textPrimary)
                        
                        Spacer()
                        
                        Button {
                            showingCreateView = true
                        } label: {
                            Image(systemName: "plus")
                                .font(KODAMFonts.heading(.title3).weight(.bold))
                                .foregroundStyle(KODAMTheme.emeraldGreen)
                                .padding(KODAMTheme.spacingMD)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.top, KODAMTheme.spacingLG)
                    .padding(.bottom, KODAMTheme.spacingMD)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: KODAMTheme.spacingLG) {
                            ForEach(SampleData.memberRequests) { request in
                                NavigationLink(destination: MemberCommodityRequestDetailView(request: request)) {
                                    GlassCard(padding: KODAMTheme.spacingMD) {
                                        VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                                            HStack {
                                                Image(systemName: "leaf.fill")
                                                    .foregroundStyle(KODAMTheme.emeraldGreen)
                                                
                                                Text(request.dateSubmitted)
                                                    .font(KODAMFonts.body(.captionSmall))
                                                    .foregroundStyle(KODAMTheme.textTertiary)
                                                
                                                Spacer()
                                                
                                                Text(request.status.rawValue)
                                                    .font(KODAMFonts.body(.captionSmall))
                                                    .foregroundStyle(Color(request.status.colorName))
                                                    .padding(.horizontal, KODAMTheme.spacingSM)
                                                    .padding(.vertical, KODAMTheme.spacingXS)
                                                    .background(Color(request.status.colorName).opacity(0.1))
                                                    .clipShape(Capsule())
                                            }
                                            
                                            Divider()
                                            
                                            HStack {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Varietas")
                                                        .font(KODAMFonts.body(.captionSmall))
                                                        .foregroundStyle(KODAMTheme.textSecondary)
                                                    Text(request.variety)
                                                        .font(KODAMFonts.heading(.headline))
                                                        .foregroundStyle(KODAMTheme.textPrimary)
                                                }
                                                Spacer()
                                                VStack(alignment: .trailing, spacing: 4) {
                                                    Text("Kuantitas")
                                                        .font(KODAMFonts.body(.captionSmall))
                                                        .foregroundStyle(KODAMTheme.textSecondary)
                                                    Text("\(request.quantityKg) kg")
                                                        .font(KODAMFonts.heading(.headline))
                                                        .foregroundStyle(KODAMTheme.textPrimary)
                                                }
                                            }
                                        }
                                    }
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)
                        .padding(.bottom, KODAMTheme.spacing3XL)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showingCreateView) {
                MemberCommodityRequestCreateView()
            }
        }
    }
}

#Preview {
    MemberCommodityRequestsView()
}
