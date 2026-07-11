import SwiftUI

enum KODAMButtonStyle {
    case primary
    case secondary
    case destructive
    case outline
}

struct KODAMButton: View {
    let title: String
    let icon: String?
    let style: KODAMButtonStyle
    let isFullWidth: Bool
    let action: () -> Void
    
    init(_ title: String, icon: String? = nil, style: KODAMButtonStyle = .primary, isFullWidth: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.style = style
        self.isFullWidth = isFullWidth
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: KODAMTheme.spacingSM) {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(title)
                    .font(KODAMFonts.heading(.headline))
            }
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .padding(.vertical, KODAMTheme.spacingMD)
            .padding(.horizontal, KODAMTheme.spacingLG)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: KODAMTheme.radiusSM))
            .overlay(
                RoundedRectangle(cornerRadius: KODAMTheme.radiusSM)
                    .strokeBorder(borderColor, lineWidth: 1)
            )
        }
    }
    
    // MARK: - Style Helpers
    private var backgroundColor: Color {
        switch style {
        case .primary: return KODAMTheme.primaryColor
        case .secondary: return KODAMTheme.cardWhite.opacity(0.8)
        case .destructive: return KODAMTheme.destructiveRed.opacity(0.1)
        case .outline: return .clear
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .primary: return .white
        case .secondary: return KODAMTheme.textPrimary
        case .destructive: return KODAMTheme.destructiveRed
        case .outline: return KODAMTheme.textPrimary
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .primary: return .clear
        case .secondary: return KODAMTheme.cardBorder
        case .destructive: return KODAMTheme.destructiveRed.opacity(0.3)
        case .outline: return KODAMTheme.textPrimary.opacity(0.2)
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        KODAMButton("Primary Button", icon: "check") {}
        KODAMButton("Secondary Button", style: .secondary) {}
        KODAMButton("Destructive Button", icon: "trash", style: .destructive) {}
        
        HStack {
            KODAMButton("Batal", style: .secondary, isFullWidth: false) {}
            KODAMButton("Kirim", isFullWidth: false) {}
        }
    }
    .padding()
    .background(KODAMTheme.warmIvory)
}
