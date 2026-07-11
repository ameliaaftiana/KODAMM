import SwiftUI

/// A custom vertical bar chart component matching Image 3.
struct BarChartComponent: View {
    // Array of (value, isHighlighted)
    let data: [(value: CGFloat, isHighlighted: Bool)]
    let height: CGFloat

    var body: some View {
        HStack(alignment: .bottom, spacing: KODAMTheme.spacingSM) {
            ForEach(0..<data.count, id: \.self) { index in
                let item = data[index]
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(item.isHighlighted ? KODAMTheme.coffeeGradientEnd : KODAMTheme.cardBorder)
                    
                    // Display percentage text if height is sufficient
                    if item.value > 0.1 {
                        Text("\(Int(item.value * 100))%")
                            .font(KODAMFonts.mono(.caption))
                            .foregroundStyle(item.isHighlighted ? Color.white : KODAMTheme.textSecondary)
                            .padding(.bottom, KODAMTheme.spacingSM)
                    }
                }
                .frame(height: item.value * height)
                .frame(maxWidth: .infinity)
            }
        }
        .frame(height: height)
    }
}

#Preview {
    ZStack {
        KODAMTheme.warmIvory.ignoresSafeArea()
        BarChartComponent(
            data: [
                (0.3, false),
                (0.5, false),
                (0.2, false),
                (0.8, false),
                (0.4, true)
            ],
            height: 150
        )
        .padding()
    }
}
