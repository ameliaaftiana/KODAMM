import SwiftUI

// MARK: - KODAM Fonts
/// Typography system using Plus Jakarta Sans (headings) and Inter (body).
/// Falls back to system fonts if custom font files aren't bundled.
///
/// To use actual Google Fonts:
/// 1. Add PlusJakartaSans-*.ttf and Inter-*.ttf to your Xcode project
/// 2. Add them to Info.plist under "Fonts provided by application"
/// 3. The font names below will automatically resolve
enum KODAMFonts {

    // MARK: - Font Family Names
    private static let jakartaSansBold = "PlusJakartaSans-Bold"
    private static let jakartaSansSemiBold = "PlusJakartaSans-SemiBold"
    private static let jakartaSansMedium = "PlusJakartaSans-Medium"
    private static let jakartaSansRegular = "PlusJakartaSans-Regular"

    private static let interBold = "Inter-Bold"
    private static let interSemiBold = "Inter-SemiBold"
    private static let interMedium = "Inter-Medium"
    private static let interRegular = "Inter-Regular"

    // MARK: - Font Availability Check
    private static func fontExists(_ name: String) -> Bool {
        UIFont(name: name, size: 12) != nil
    }

    // MARK: - Heading Fonts (Plus Jakarta Sans)
    static func heading(_ style: HeadingStyle) -> Font {
        let name = style.fontName
        let size = style.defaultSize
        if fontExists(name) {
            return .custom(name, size: size, relativeTo: style.textStyle)
        }
        // Fallback to system rounded for headings
        return .system(style.textStyle, design: .rounded, weight: style.weight)
    }

    // MARK: - Body Fonts (Inter)
    static func body(_ style: BodyStyle) -> Font {
        let name = style.fontName
        let size = style.defaultSize
        if fontExists(name) {
            return .custom(name, size: size, relativeTo: style.textStyle)
        }
        // Fallback to system default for body
        return .system(style.textStyle, design: .default, weight: style.weight)
    }

    // MARK: - Monospaced (SF Mono for codes)
    static func mono(_ textStyle: Font.TextStyle = .caption) -> Font {
        .system(textStyle, design: .monospaced, weight: .medium)
    }
}

// MARK: - Heading Styles
extension KODAMFonts {
    enum HeadingStyle {
        case largeTitle      // Screen titles
        case title1          // Section titles
        case title2          // Card titles
        case title3          // Subsection titles
        case headline        // Emphasized labels

        var fontName: String {
            switch self {
            case .largeTitle, .title1: return KODAMFonts.jakartaSansBold
            case .title2: return KODAMFonts.jakartaSansSemiBold
            case .title3, .headline: return KODAMFonts.jakartaSansMedium
            }
        }

        var defaultSize: CGFloat {
            switch self {
            case .largeTitle: return 28
            case .title1: return 22
            case .title2: return 18
            case .title3: return 16
            case .headline: return 15
            }
        }

        var textStyle: Font.TextStyle {
            switch self {
            case .largeTitle: return .largeTitle
            case .title1: return .title
            case .title2: return .title2
            case .title3: return .title3
            case .headline: return .headline
            }
        }

        var weight: Font.Weight {
            switch self {
            case .largeTitle, .title1: return .bold
            case .title2: return .semibold
            case .title3, .headline: return .medium
            }
        }
    }
}

// MARK: - Body Styles
extension KODAMFonts {
    enum BodyStyle {
        case bodyLarge       // Primary body text
        case body            // Standard body
        case bodySmall       // Secondary info
        case caption         // Captions & labels
        case captionSmall    // Tiny labels & badges

        var fontName: String {
            switch self {
            case .bodyLarge: return KODAMFonts.interMedium
            case .body: return KODAMFonts.interRegular
            case .bodySmall: return KODAMFonts.interRegular
            case .caption: return KODAMFonts.interMedium
            case .captionSmall: return KODAMFonts.interSemiBold
            }
        }

        var defaultSize: CGFloat {
            switch self {
            case .bodyLarge: return 16
            case .body: return 15
            case .bodySmall: return 13
            case .caption: return 12
            case .captionSmall: return 11
            }
        }

        var textStyle: Font.TextStyle {
            switch self {
            case .bodyLarge: return .body
            case .body: return .body
            case .bodySmall: return .subheadline
            case .caption: return .caption
            case .captionSmall: return .caption2
            }
        }

        var weight: Font.Weight {
            switch self {
            case .bodyLarge: return .medium
            case .body: return .regular
            case .bodySmall: return .regular
            case .caption: return .medium
            case .captionSmall: return .semibold
            }
        }
    }
}
