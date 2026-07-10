import SwiftUI

struct CoopCommodityRequestsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = "Permintaan Baru"
    private let tabs = ["Permintaan Baru", "Diproses"]
    
    var filteredRequests: [MemberCommodityRequest] {
        if selectedTab == "Permintaan Baru" {
            return SampleData.memberRequests.filter { $0.status == .pending }
        } else {
            return SampleData.memberRequests.filter { $0.status != .pending }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    
                    Spacer()
                    
                    Text("Permintaan Anggota")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Spacer()
                    
                    // Invisible placeholder for alignment
                    Image(systemName: "chevron.left")
                        .opacity(0)
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingMD)
                
                // Tabs
                TextTabRow(tabs: tabs, selectedTab: $selectedTab, justified: true)
                    .padding(.top, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: KODAMTheme.spacingLG) {
                        ForEach(filteredRequests) { request in
                            if selectedTab == "Diproses" {
                                NavigationLink(destination: CoopCommodityRequestDetailView(request: request)) {
                                    requestCard(request)
                                }
                                .buttonStyle(PlainButtonStyle())
                            } else {
                                requestCard(request)
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
    
    private func requestCard(_ request: MemberCommodityRequest) -> some View {
        GlassCard(padding: KODAMTheme.spacingMD) {
            VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                HStack {
                    Circle()
                        .fill(KODAMTheme.warmIvoryDarker)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Image(systemName: request.memberAvatar)
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(request.memberName)
                            .font(KODAMFonts.heading(.headline))
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
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Proses")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(request.processType)
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                }
                
                if request.status == .pending {
                    Button {
                        // Accept action (mock)
                    } label: {
                        Text("Terima Permintaan")
                            .font(KODAMFonts.heading(.headline))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, KODAMTheme.spacingMD)
                            .background(KODAMTheme.emeraldGreen)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
                    }
                    .padding(.top, KODAMTheme.spacingSM)
                }
            }
        }
    }
}

#Preview {
    CoopCommodityRequestsView()
}
