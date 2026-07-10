import Foundation

struct ChatConversation: Identifiable {
    let id: String
    let name: String
    let lastMessage: String
    let timestamp: String
    let unreadCount: Int
    let isOnline: Bool
    let avatarSystemName: String
    let isRead: Bool
}

struct ChatMessage: Identifiable {
    let id: String
    let text: String
    let isFromMe: Bool
    let timestamp: String
    let isRead: Bool
    let attachment: ChatAttachment?
}

struct ChatAttachment {
    let fileName: String
    let subtitle: String
    let fileSize: String
    let fileType: String
}
