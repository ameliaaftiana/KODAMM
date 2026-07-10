import SwiftUI

// MARK: - Chat Row Card
/// Chat conversation row matching reference Image 4.
/// Shows avatar, online indicator, name, timestamp, last message, and unread badge.
struct ChatRowCard: View {
    let conversation: ChatConversation
    var onTap: (() -> Void)? = nil

    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: KODAMTheme.spacingMD) {
                // Avatar with online indicator
                ZStack(alignment: .bottomLeading) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: avatarColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 48, height: 48)
                        .overlay {
                            if conversation.avatarSystemName.contains("flask") {
                                Image(systemName: "flask.fill")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(.white)
                            } else if conversation.avatarSystemName.contains("t.circle") {
                                Text("T")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(.white)
                            } else {
                                Image(systemName: "person.fill")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(.white)
                            }
                        }

                    if conversation.isOnline {
                        Circle()
                            .fill(KODAMTheme.emeraldGreen)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Circle()
                                    .strokeBorder(KODAMTheme.warmIvory, lineWidth: 2)
                            )
                    }
                }

                // Content
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(conversation.name)
                            .font(KODAMFonts.heading(.headline))
                            .foregroundStyle(KODAMTheme.textPrimary)
                            .lineLimit(1)

                        Spacer()

                        Text(conversation.timestamp)
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(
                                conversation.unreadCount > 0
                                    ? KODAMTheme.espressoAccent
                                    : KODAMTheme.textTertiary
                            )
                    }

                    HStack {
                        Text(conversation.lastMessage)
                            .font(KODAMFonts.body(.bodySmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                            .lineLimit(1)

                        Spacer()

                        if conversation.unreadCount > 0 {
                            // Unread count badge
                            Text("\(conversation.unreadCount)")
                                .font(KODAMFonts.body(.captionSmall))
                                .foregroundStyle(.white)
                                .frame(width: 20, height: 20)
                                .background(Circle().fill(KODAMTheme.espressoAccent))
                        } else if conversation.isRead {
                            // Read checkmarks
                            Image(systemName: "checkmark.message.fill")
                                .font(KODAMFonts.body(.body))
                                .foregroundStyle(KODAMTheme.textTertiary)
                        }
                    }
                }
            }
            .padding(.vertical, KODAMTheme.spacingSM)
        }
        .buttonStyle(.plain)
    }

    private var avatarColors: [Color] {
        if conversation.name.contains("Gayo") {
            return [KODAMTheme.emeraldGreen, KODAMTheme.emeraldGreen.opacity(0.8)]
        } else if conversation.name.contains("Bajawa") {
            return [KODAMTheme.coffeeGradientStart, KODAMTheme.coffeeGradientEnd]
        } else if conversation.name.contains("Lab") {
            return [KODAMTheme.scientificCyan, KODAMTheme.scientificCyan.opacity(0.8)]
        } else {
            return [KODAMTheme.textSecondary, KODAMTheme.textTertiary]
        }
    }
}

#Preview {
    VStack(spacing: 0) {
        ForEach(SampleData.chatConversations) { conversation in
            ChatRowCard(conversation: conversation)
            if conversation.id != SampleData.chatConversations.last?.id {
                Divider()
                    .padding(.leading, 68)
            }
        }
    }
    .padding(.horizontal)
    .background(KODAMTheme.warmIvory)
}
