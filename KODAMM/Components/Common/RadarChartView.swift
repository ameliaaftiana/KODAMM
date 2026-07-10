import SwiftUI

// MARK: - Radar Chart View
/// SCA score radar chart displaying cupping scores across categories.
struct RadarChartView: View {
    let scores: [RadarDataPoint]
    let maxScore: Double

    struct RadarDataPoint: Identifiable {
        let id = UUID()
        let label: String
        let value: Double
    }

    init(certificate: LabCertificate) {
        self.maxScore = 10.0
        self.scores = [
            RadarDataPoint(label: "Rasa", value: certificate.scaRasa),
            RadarDataPoint(label: "Aroma", value: certificate.scaAroma),
            RadarDataPoint(label: "Keasaman", value: certificate.scaKeasaman),
            RadarDataPoint(label: "Body", value: certificate.scaBody),
            RadarDataPoint(label: "Balance", value: certificate.scaKeseimbangan),
            RadarDataPoint(label: "Aftertaste", value: certificate.scaAftertaste),
        ]
    }

    var body: some View {
        GeometryReader { geometry in
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2.5
            let angleStep = (2 * .pi) / Double(scores.count)

            ZStack {
                // Background grid rings
                ForEach([0.25, 0.5, 0.75, 1.0], id: \.self) { scale in
                    radarPath(center: center, radius: radius * scale, count: scores.count)
                        .stroke(KODAMTheme.cardBorder.opacity(0.5), lineWidth: 0.5)
                }

                // Axis lines
                ForEach(0..<scores.count, id: \.self) { index in
                    let angle = angleStep * Double(index) - .pi / 2
                    Path { path in
                        path.move(to: center)
                        path.addLine(to: CGPoint(
                            x: center.x + radius * cos(angle),
                            y: center.y + radius * sin(angle)
                        ))
                    }
                    .stroke(KODAMTheme.cardBorder.opacity(0.4), lineWidth: 0.5)
                }

                // Data fill
                radarDataPath(center: center, radius: radius, count: scores.count)
                    .fill(KODAMTheme.espressoAccent.opacity(0.15))

                radarDataPath(center: center, radius: radius, count: scores.count)
                    .stroke(KODAMTheme.espressoAccent, lineWidth: 2)

                // Data points
                ForEach(0..<scores.count, id: \.self) { index in
                    let angle = angleStep * Double(index) - .pi / 2
                    let normalizedValue = scores[index].value / maxScore
                    let point = CGPoint(
                        x: center.x + radius * normalizedValue * cos(angle),
                        y: center.y + radius * normalizedValue * sin(angle)
                    )

                    Circle()
                        .fill(KODAMTheme.espressoAccent)
                        .frame(width: 6, height: 6)
                        .position(point)
                }

                // Labels
                ForEach(0..<scores.count, id: \.self) { index in
                    let angle = angleStep * Double(index) - .pi / 2
                    let labelRadius = radius + 28
                    let point = CGPoint(
                        x: center.x + labelRadius * cos(angle),
                        y: center.y + labelRadius * sin(angle)
                    )

                    VStack(spacing: 1) {
                        Text(scores[index].label)
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textSecondary)
                        Text(String(format: "%.1f", scores[index].value))
                            .font(KODAMFonts.body(.captionSmall))
                            .foregroundStyle(KODAMTheme.textPrimary)
                    }
                    .position(point)
                }
            }
        }
    }

    // MARK: - Helpers

    private func radarPath(center: CGPoint, radius: Double, count: Int) -> Path {
        let angleStep = (2 * .pi) / Double(count)
        var path = Path()
        for i in 0..<count {
            let angle = angleStep * Double(i) - .pi / 2
            let point = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }

    private func radarDataPath(center: CGPoint, radius: Double, count: Int) -> Path {
        let angleStep = (2 * .pi) / Double(count)
        var path = Path()
        for i in 0..<count {
            let angle = angleStep * Double(i) - .pi / 2
            let normalizedValue = scores[i].value / maxScore
            let point = CGPoint(
                x: center.x + radius * normalizedValue * cos(angle),
                y: center.y + radius * normalizedValue * sin(angle)
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

#Preview {
    VStack {
        RadarChartView(certificate: SampleData.gayoCertificate)
            .frame(height: 250)
    }
    .padding()
    .background(KODAMTheme.warmIvory)
}
