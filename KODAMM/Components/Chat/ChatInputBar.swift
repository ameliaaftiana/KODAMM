import SwiftUI

// MARK: - Chat Input Bar
/// Message input bar matching reference Image 5 bottom.
/// Includes attachment button, text field, and send button.
struct ChatInputBar: View {
    @Binding var text: String
    var onSend: (() -> Void)? = nil
    var onAttach: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: KODAMTheme.spacingMD) {
            // Plus/Attach button
            Button {
                onAttach?()
            } label: {
                Image(systemName: "plus")
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.textSecondary)
                    .frame(width: 36, height: 36)
            }

            // Text field
            HStack(spacing: KODAMTheme.spacingSM) {
                TextField("Ketik pesan...", text: $text)
                    .font(KODAMFonts.body(.body))
                    .foregroundStyle(KODAMTheme.textPrimary)

                Button {
                    // Attachment/clip
                } label: {
                    Image(systemName: "paperclip")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.textTertiary)
                }
            }
            .padding(.horizontal, KODAMTheme.spacingMD)
            .padding(.vertical, KODAMTheme.spacingMD)
            .background(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusFull)
                    .fill(KODAMTheme.warmIvoryDarker)
            )

            // Send button
            Button {
                onSend?()
            } label: {
                Image(systemName: "arrow.up")
                    .font(KODAMFonts.heading(.title3))
                    .foregroundStyle(.white)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(
                                text.isEmpty
                                    ? KODAMTheme.textTertiary
                                    : KODAMTheme.espressoAccent
                            )
                    )
            }
            .disabled(text.isEmpty)
            .sensoryFeedback(.impact(weight: .light), trigger: text.isEmpty)
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
        .padding(.vertical, KODAMTheme.spacingMD)
        .background(
            Rectangle()
                .fill(KODAMTheme.cardWhite)
                .shadow(color: KODAMTheme.obsidianDark.opacity(0.05), radius: 8, x: 0, y: -2)
        )
    }
}

#Preview {
    VStack {
        Spacer()
        ChatInputBar(text: .constant(""))
        ChatInputBar(text: .constant("Hello there"))
    }
    .background(KODAMTheme.warmIvory)
}
