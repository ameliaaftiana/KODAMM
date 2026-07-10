import SwiftUI

// MARK: - User Chat Detail View
/// Individual chat thread matching reference Image 5.
/// Shows contact header, date separator, message bubbles, and input bar.
struct UserChatDetailView: View {
    let conversation: ChatConversation
    @State private var messageText = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            KODAMTheme.warmIvory
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // MARK: Chat Header
                chatHeader

                Divider()

                // MARK: Messages
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: KODAMTheme.spacingLG) {
                        // Date separator
                        dateSeparator("HARI INI, 10:42")

                        // Messages
                        ForEach(SampleData.chatMessages) { message in
                            ChatBubble(message: message)
                        }
                    }
                    .padding(.vertical, KODAMTheme.spacingLG)
                }

                // MARK: Input Bar
                ChatInputBar(
                    text: $messageText,
                    onSend: {
                        // Send message
                        messageText = ""
                    }
                )
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Chat Header
    private var chatHeader: some View {
        HStack(spacing: KODAMTheme.spacingMD) {
            // Back button
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.textPrimary)
            }

            // Avatar
            ZStack(alignment: .bottomLeading) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [KODAMTheme.emeraldGreen, KODAMTheme.emeraldGreen.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "person.fill")
                            .font(KODAMFonts.body(.bodyLarge))
                            .foregroundStyle(.white)
                    }

                Circle()
                    .fill(KODAMTheme.emeraldGreen)
                    .frame(width: 10, height: 10)
                    .overlay(
                        Circle()
                            .strokeBorder(KODAMTheme.warmIvory, lineWidth: 1.5)
                    )
            }

            // Name and status
            VStack(alignment: .leading, spacing: 1) {
                HStack(spacing: 4) {
                    Text("Koperasi Karya Mandiri")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundStyle(KODAMTheme.textPrimary)
                        .lineLimit(1)

                    Image(systemName: "checkmark.seal.fill")
                        .font(KODAMFonts.body(.bodySmall))
                        .foregroundStyle(KODAMTheme.amberGold)
                }

                HStack(spacing: 4) {
                    Circle()
                        .fill(KODAMTheme.emeraldGreen)
                        .frame(width: 6, height: 6)
                    Text("Sedang aktif")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.emeraldGreen)
                }
            }

            Spacer()

            // More options
            Button {
                // Options menu
            } label: {
                Image(systemName: "ellipsis.vertical")
                    .font(KODAMFonts.heading(.title2))
                    .foregroundStyle(KODAMTheme.textSecondary)
                    .frame(width: 36, height: 36)
            }
        }
        .padding(.horizontal, KODAMTheme.spacingLG)
        .padding(.vertical, KODAMTheme.spacingMD)
        .background(KODAMTheme.warmIvory)
    }

    // MARK: - Date Separator
    private func dateSeparator(_ text: String) -> some View {
        HStack {
            Spacer()
            Text(text)
                .font(KODAMFonts.body(.captionSmall))
                .foregroundStyle(KODAMTheme.textTertiary)
                .padding(.horizontal, KODAMTheme.spacingMD)
                .padding(.vertical, KODAMTheme.spacingSM)
                .background(
                    Capsule()
                        .fill(KODAMTheme.warmIvoryDarker)
                )
            Spacer()
        }
    }
}

#Preview {
    UserChatDetailView(
        conversation: SampleData.chatConversations[0]
    )
}
