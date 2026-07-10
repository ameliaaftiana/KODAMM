import SwiftUI

// MARK: - Glass Card
/// A reusable glassmorphism card container with rounded corners,
/// subtle shadow, and optional thin border.
struct GlassCard<Content: View>: View {
    let cornerRadius: CGFloat
    let padding: CGFloat
    let useMaterial: Bool
    @ViewBuilder let content: () -> Content

    init(
        cornerRadius: CGFloat = KODAMTheme.radiusLG,
        padding: CGFloat = KODAMTheme.spacingLG,
        useMaterial: Bool = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.useMaterial = useMaterial
        self.content = content
    }

    var body: some View {
        content()
            .padding(padding)
            .background {
                if useMaterial {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.ultraThinMaterial)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(KODAMTheme.cardWhite)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(KODAMTheme.cardBorder.opacity(0.5), lineWidth: 0.5)
            }
            .shadow(color: KODAMTheme.obsidianDark.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

// MARK: - Glass Card Modifier (for existing views)
struct GlassCardModifier: ViewModifier {
    let cornerRadius: CGFloat
    let useMaterial: Bool

    func body(content: Content) -> some View {
        content
            .background {
                if useMaterial {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.ultraThinMaterial)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(KODAMTheme.cardWhite)
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(KODAMTheme.cardBorder.opacity(0.5), lineWidth: 0.5)
            }
            .shadow(color: KODAMTheme.obsidianDark.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

extension View {
    func glassCard(
        cornerRadius: CGFloat = KODAMTheme.radiusLG,
        useMaterial: Bool = false
    ) -> some View {
        modifier(GlassCardModifier(cornerRadius: cornerRadius, useMaterial: useMaterial))
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        VStack(spacing: 16) {
            GlassCard {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Glass Card")
                        .font(KODAMFonts.heading(.title2))
                    Text("This is a glassmorphism container with subtle shadow.")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
            }

            GlassCard(useMaterial: true) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Material Card")
                        .font(KODAMFonts.heading(.title2))
                    Text("This uses ultraThinMaterial for frosted glass.")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
            }
        }
        .padding()
    }
}
