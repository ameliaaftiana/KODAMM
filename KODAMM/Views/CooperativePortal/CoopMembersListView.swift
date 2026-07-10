import SwiftUI

struct CoopMembersListView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header (No navigation bar title, just a back button and a big title)
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(KODAMFonts.heading(.title3).weight(.bold))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    Spacer()
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.bottom, KODAMTheme.spacingSM)
                
                Text("Daftar Anggota")
                    .font(KODAMFonts.heading(.largeTitle))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, KODAMTheme.spacingLG)
                    .padding(.bottom, KODAMTheme.spacingMD)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: KODAMTheme.spacingMD) {
                        ForEach(SampleData.coopMembers) { member in
                            GlassCard(padding: KODAMTheme.spacingMD) {
                                HStack(spacing: KODAMTheme.spacingMD) {
                                    Circle()
                                        .fill(KODAMTheme.warmIvoryDarker)
                                        .frame(width: 50, height: 50)
                                        .overlay {
                                            Image(systemName: member.avatarImage)
                                                .font(.title2)
                                                .foregroundStyle(KODAMTheme.textSecondary)
                                        }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(member.name)
                                            .font(KODAMFonts.heading(.headline))
                                            .foregroundStyle(KODAMTheme.textPrimary)
                                        Text(member.memberId)
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(KODAMTheme.textSecondary)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text(member.isActive ? "Aktif" : "Non-aktif")
                                            .font(KODAMFonts.body(.captionSmall))
                                            .foregroundStyle(member.isActive ? KODAMTheme.emeraldGreen : KODAMTheme.textTertiary)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(member.isActive ? KODAMTheme.emeraldGreen.opacity(0.1) : KODAMTheme.cardBorder)
                                            .clipShape(Capsule())
                                    }
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
    CoopMembersListView()
}
