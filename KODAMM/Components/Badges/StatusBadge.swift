import SwiftUI

// MARK: - Status Badge
/// Pill-shaped status badge with SF Symbol icon for order status.
struct StatusBadge: View {
    let status: OrderStatus

    private var backgroundColor: Color {
        switch status {
        case .inTransit: return KODAMTheme.statusAmber
        case .processing: return KODAMTheme.statusGreen
        case .completed: return KODAMTheme.statusCyan
        case .cancelled: return KODAMTheme.destructiveLight
        }
    }

    private var textColor: Color {
        switch status {
        case .inTransit: return KODAMTheme.statusAmberText
        case .processing: return KODAMTheme.statusGreenText
        case .completed: return KODAMTheme.statusCyanText
        case .cancelled: return KODAMTheme.destructiveRed
        }
    }

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: status.icon)
                .font(KODAMFonts.body(.captionSmall))

            Text(status.rawValue)
                .font(KODAMFonts.body(.captionSmall))
        }
        .foregroundStyle(textColor)
        .padding(.horizontal, KODAMTheme.spacingMD)
        .padding(.vertical, KODAMTheme.spacingSM)
        .background(
            Capsule()
                .fill(backgroundColor)
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        StatusBadge(status: .inTransit)
        StatusBadge(status: .processing)
        StatusBadge(status: .completed)
        StatusBadge(status: .cancelled)
    }
    .padding()
}
