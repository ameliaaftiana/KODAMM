import SwiftUI

// MARK: - KODAM Theme
enum KODAMTheme {

    // MARK: Core Colors
    static let obsidianDark = Color(hex: "1A1817")
    static let espressoAccent = Color(hex: "8B5A2B")
    static let espressoDark = Color(hex: "3C2415")
    static let primaryColor = Color(hex: "4E342E") // Dark brownish
    static let emeraldGreen = Color(hex: "1F7A53")
    static let oliveGreen = Color(hex: "4A5D23")
    static let amberGold = Color(hex: "D4AF37")
    static let scientificCyan = Color(hex: "0A85EA")
    static let royalPurple = Color(hex: "6B3FA0")

    // MARK: Surface Colors
    static let warmIvory = Color(hex: "FAF6F1")
    static let warmIvoryDarker = Color(hex: "F0EBE4")
    static let cardWhite = Color.white
    static let cardBorder = Color(hex: "E8E2DA")

    // MARK: Text Colors
    static let textPrimary = Color(hex: "1A1817")
    static let textSecondary = Color(hex: "8E8680")
    static let textTertiary = Color(hex: "B5AFA8")

    // MARK: Status Colors
    static let statusAmber = Color(hex: "F5E6C8")
    static let statusAmberText = Color(hex: "8B6914")
    static let statusGreen = Color(hex: "D4EDDA")
    static let statusGreenText = Color(hex: "1F7A53")
    static let statusCyan = Color(hex: "D1ECF1")
    static let statusCyanText = Color(hex: "0A85EA")
    static let destructiveRed = Color(hex: "DC3545")
    
    // MARK: Custom Highlights & Accents
    static let highlightLight = Color(hex: "FFF8E7")
    static let successLight = Color(hex: "E8F5E9")
    static let destructiveLight = Color(hex: "F8D7DA")
    static let fileAttachmentBackground = Color(hex: "FFF3E0")
    
    // MARK: Coffee Gradients
    static let coffeeGradientStart = Color(hex: "8B7355")
    static let coffeeGradientMid = Color(hex: "6B5B3E")
    static let coffeeGradientEnd = Color(hex: "A0926C")

    // MARK: Badge Colors
    static let halalBadgeBackground = Color(hex: "1F7A53")
    static let gradeBadgeBackground = Color.white.opacity(0.9)
    static let scoreBadgeBackground = Color(hex: "8B5A2B").opacity(0.85)

    // MARK: Spacing
    static let spacingXS: CGFloat = 4
    static let spacingSM: CGFloat = 8
    static let spacingMD: CGFloat = 12
    static let spacingLG: CGFloat = 16
    static let spacingXL: CGFloat = 20
    static let spacingXXL: CGFloat = 24
    static let spacing3XL: CGFloat = 32

    // MARK: Corner Radius
    static let radiusSM: CGFloat = 8
    static let radiusMD: CGFloat = 12
    static let radiusLG: CGFloat = 16
    static let radiusXL: CGFloat = 20
    static let radiusFull: CGFloat = 100

    // MARK: Role Accent
    static func roleAccentColor(for role: UserRoleType) -> Color {
        switch role {
        case .userBuyer: return amberGold
        case .cooperative: return emeraldGreen
        case .labMitra: return scientificCyan
        case .admin: return royalPurple
        }
    }
}

// MARK: - Color Hex Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Formatters
extension Double {
    func formattedRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 0
        if let result = formatter.string(from: NSNumber(value: self)) {
            return "Rp. \(result)"
        }
        return "Rp. \(Int(self))"
    }
}
