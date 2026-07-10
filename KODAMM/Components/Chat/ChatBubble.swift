import SwiftUI

// MARK: - Chat Bubble
/// Message bubble matching reference Image 5.
/// Incoming (left) vs outgoing (right) with timestamp and read status.
struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        VStack(alignment: message.isFromMe ? .trailing : .leading, spacing: 4) {
            HStack {
                if message.isFromMe { Spacer(minLength: 60) }

                VStack(alignment: .leading, spacing: KODAMTheme.spacingSM) {
                    Text(message.text)
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(message.isFromMe ? KODAMTheme.espressoDark : KODAMTheme.textPrimary)

                    // Attachment if present
                    if let attachment = message.attachment {
                        FileAttachmentCard(attachment: attachment)
                    }
                }
                .padding(.horizontal, KODAMTheme.spacingLG)
                .padding(.vertical, KODAMTheme.spacingMD)
                .background(
                    bubbleShape
                        .fill(message.isFromMe ? Color(hex: "F5E6C8") : KODAMTheme.cardWhite)
                )
                .shadow(color: KODAMTheme.obsidianDark.opacity(0.04), radius: 4, x: 0, y: 1)

                if !message.isFromMe { Spacer(minLength: 60) }
            }

            // Timestamp + read status
            HStack(spacing: 4) {
                Text(message.timestamp)
                    .font(KODAMFonts.body(.captionSmall))
                    .foregroundStyle(KODAMTheme.textTertiary)

                if message.isFromMe && message.isRead {
                    Image(systemName: "checkmark")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textTertiary)
                    Image(systemName: "checkmark")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.textTertiary)
                        .offset(x: -6)
                }
            }
            .padding(.horizontal, 4)
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
    }

    private var bubbleShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: KODAMTheme.radiusLG)
    }
}

#Preview {
    VStack(spacing: 16) {
        ForEach(SampleData.chatMessages) { message in
            ChatBubble(message: message)
        }
    }
    .padding(.vertical)
    .background(KODAMTheme.warmIvory)
}
