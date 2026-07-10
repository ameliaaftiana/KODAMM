import SwiftUI

/// Glassmorphism card for cooperative member, matching Image 1.
struct CoopMemberCard: View {
    let member: CoopMember

    var body: some View {
        GlassCard(padding: KODAMTheme.spacingLG) {
            HStack(alignment: .top, spacing: KODAMTheme.spacingMD) {
                // Avatar
                Circle()
                    .fill(KODAMTheme.cardBorder)
                    .frame(width: 48, height: 48)
                    .overlay {
                        Image(systemName: member.avatarImage)
                            .resizable()
                            .foregroundStyle(KODAMTheme.textTertiary)
                            .padding(KODAMTheme.spacingSM)
                    }
                    .clipShape(Circle())
                    .overlay(
                        Circle().strokeBorder(KODAMTheme.warmIvory, lineWidth: 2)
                    )

                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(member.name)
                                .font(KODAMFonts.heading(.title3))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Text(member.memberId)
                                .font(KODAMFonts.mono(.caption))
                                .foregroundStyle(KODAMTheme.textSecondary)
                        }

                        Spacer()

                        // Status Badge
                        Text(member.isActive ? "Aktif" : "Non-aktif")
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(member.isActive ? KODAMTheme.textSecondary : KODAMTheme.textPrimary)
                            .padding(.horizontal, KODAMTheme.spacingMD)
                            .padding(.vertical, KODAMTheme.spacingXS)
                            .background(
                                Capsule()
                                    .fill(member.isActive ? KODAMTheme.cardBorder : KODAMTheme.cardBorder.opacity(0.5))
                            )
                            .overlay(
                                Capsule().strokeBorder(member.isActive ? KODAMTheme.cardBorder : KODAMTheme.cardBorder, lineWidth: 0.5)
                            )
                    }

                    Divider()
                        .padding(.vertical, KODAMTheme.spacingXS)

                    HStack(spacing: 6) {
                        Image(systemName: "phone")
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        
                        Text(member.phone)
                            .font(KODAMFonts.mono(.caption))
                            .foregroundStyle(KODAMTheme.textSecondary)
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        CoopMemberCard(member: SampleData.coopMembers[0])
            .padding()
    }
}
