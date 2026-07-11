import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            KODAMTheme.warmIvory.ignoresSafeArea()
            
            VStack(spacing: KODAMTheme.spacingXL) {
                Image(systemName: "leaf.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(KODAMTheme.emeraldGreen)
                    .scaleEffect(isAnimating ? 1.1 : 0.9)
                    .animation(
                        Animation.easeInOut(duration: 1.0)
                            .repeatForever(autoreverses: true),
                        value: isAnimating
                    )
                
                VStack(spacing: KODAMTheme.spacingSM) {
                    Text("KODAM")
                        .font(KODAMFonts.heading(.largeTitle))
                        .foregroundStyle(KODAMTheme.textPrimary)
                    
                    Text("Memuat data...")
                        .font(KODAMFonts.body(.body))
                        .foregroundStyle(KODAMTheme.textSecondary)
                }
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    LoadingView()
}
