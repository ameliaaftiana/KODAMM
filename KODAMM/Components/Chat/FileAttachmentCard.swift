import SwiftUI

// MARK: - File Attachment Card
/// Displays a file attachment inside a chat bubble.
/// Shows file icon, name, subtitle, size, and type.
struct FileAttachmentCard: View {
    let attachment: ChatAttachment

    var body: some View {
        HStack(spacing: KODAMTheme.spacingMD) {
            // File icon
            RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                .fill(KODAMTheme.fileAttachmentBackground)
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "doc.text.fill")
                        .font(KODAMFonts.heading(.title2))
                        .foregroundStyle(KODAMTheme.amberGold)
                }

            VStack(alignment: .leading, spacing: 2) {
                Text(attachment.fileName)
                    .font(KODAMFonts.body(.caption))
                    .foregroundStyle(KODAMTheme.textPrimary)
                    .lineLimit(1)

                HStack(spacing: 4) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.emeraldGreen)
                    Text(attachment.subtitle)
                        .font(KODAMFonts.body(.captionSmall))
                        .foregroundStyle(KODAMTheme.emeraldGreen)
                }

                Text("\(attachment.fileSize) • \(attachment.fileType)")
                    .font(KODAMFonts.body(.captionSmall))
                    .foregroundStyle(KODAMTheme.textTertiary)
            }
        }
        .padding(KODAMTheme.spacingMD)
        .background(
            RoundedRectangle(cornerRadius: KODAMTheme.radiusMD)
                .fill(KODAMTheme.cardWhite)
                .shadow(color: KODAMTheme.obsidianDark.opacity(0.04), radius: 2, x: 0, y: 1)
        )
    }
}

#Preview {
    FileAttachmentCard(
        attachment: ChatAttachment(
            fileName: "Lot_GAYO_042_Report.pdf",
            subtitle: "Laporan Q-Grader Terverifikasi",
            fileSize: "2.4 MB",
            fileType: "Dokumen PDF"
        )
    )
    .padding()
    .background(KODAMTheme.warmIvory)
}
