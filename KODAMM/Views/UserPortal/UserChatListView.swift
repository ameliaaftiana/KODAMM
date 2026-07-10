import SwiftUI

// MARK: - User Chat List View
/// Chat conversations list matching reference Image 4.
/// Shows search bar and conversation rows with avatars, timestamps, and unread counts.
struct UserChatListView: View {
    @State private var searchText = ""
    @State private var selectedConversation: ChatConversation? = nil

    private var filteredConversations: [ChatConversation] {
        if searchText.isEmpty {
            return SampleData.chatConversations
        }
        return SampleData.chatConversations.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                KODAMTheme.warmIvory
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingLG) {
                        // Header
                        HStack {
                            Text("Pesan")
                                .font(KODAMFonts.heading(.largeTitle))
                                .foregroundStyle(KODAMTheme.textPrimary)

                            Spacer()

                            Button {
                                // More options
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(KODAMFonts.heading(.title2))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                    .frame(width: 36, height: 36)
                                    .background(
                                        Circle()
                                            .fill(KODAMTheme.warmIvoryDarker)
                                    )
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Search
                        KODAMSearchBar(
                            text: $searchText,
                            placeholder: "Cari pesan...",
                            showFilterButton: false
                        )
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        // Conversation List
                        LazyVStack(spacing: 0) {
                            ForEach(filteredConversations) { conversation in
                                NavigationLink {
                                    UserChatDetailView(conversation: conversation)
                                } label: {
                                    VStack(spacing: 0) {
                                        ChatRowCard(conversation: conversation)

                                        if conversation.id != filteredConversations.last?.id {
                                            Divider()
                                                .padding(.leading, 68)
                                        }
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, KODAMTheme.spacingLG)

                        Spacer(minLength: 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    UserChatListView()
}
