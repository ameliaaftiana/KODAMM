import SwiftUI
import AVFoundation

struct BeanQualityScannerView: View {
    @State private var mlService = TwoStepBeanQualityDetectionService()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Camera Layer
            CameraPreviewView(service: mlService)
                .ignoresSafeArea()
            
            // Bounding Box Overlay
            GeometryReader { geometry in
                ForEach(0..<mlService.detectedBeans.count, id: \.self) { index in
                    let bean = mlService.detectedBeans[index]
                    // Convert normalized coordinates (0,0 bottom-left) to screen coordinates (0,0 top-left)
                    // The camera feed is 16:9 (1080x1920 in portrait). The screen is typically 19.5:9.
                    // .resizeAspectFill scales the video up to fill the screen and crops the edges.
                    let bufferWidth: CGFloat = 1080.0
                    let bufferHeight: CGFloat = 1920.0
                    let scale = max(geometry.size.width / bufferWidth, geometry.size.height / bufferHeight)
                    let scaledWidth = bufferWidth * scale
                    let scaledHeight = bufferHeight * scale
                    let xOffset = (geometry.size.width - scaledWidth) / 2.0
                    let yOffset = (geometry.size.height - scaledHeight) / 2.0
                    
                    let rect = CGRect(
                        x: xOffset + bean.boundingBox.minX * scaledWidth,
                        y: yOffset + (1.0 - bean.boundingBox.minY - bean.boundingBox.height) * scaledHeight,
                        width: bean.boundingBox.width * scaledWidth,
                        height: bean.boundingBox.height * scaledHeight
                    )
                    
                    Rectangle()
                        .path(in: rect)
                        .stroke(colorForDefect(bean.classification), lineWidth: 2)
                        .overlay(alignment: .topLeading) {
                            Text(bean.classification.rawValue)
                                .font(.caption2)
                                .padding(2)
                                .background(colorForDefect(bean.classification).opacity(0.7))
                                .foregroundColor(.white)
                                .offset(x: rect.minX, y: rect.minY - 14)
                        }
                }
            }
            .animation(.linear(duration: 0.1), value: mlService.detectedBeans.count)
            
            // UI Overlay
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundStyle(.white, .black.opacity(0.5))
                    }
                    Spacer()
                    Text("Spot Check AI Scanner")
                        .font(KODAMFonts.heading(.headline))
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        // Switch camera or torch
                    } label: {
                        Image(systemName: "bolt.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Circle().fill(.black.opacity(0.5)))
                    }
                }
                .padding()
                
                Spacer()
                
                // Metrics Card
                GlassCard(padding: KODAMTheme.spacingMD) {
                    VStack(alignment: .leading, spacing: KODAMTheme.spacingMD) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Total Biji Terdeteksi")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                Text("\(mlService.totalBeansCounted)")
                                    .font(KODAMFonts.heading(.title1))
                                    .foregroundStyle(KODAMTheme.textPrimary)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Prediksi Mutu SNI")
                                    .font(KODAMFonts.body(.captionSmall))
                                    .foregroundStyle(KODAMTheme.textSecondary)
                                
                                Text(mlService.currentGrade.rawValue)
                                    .font(KODAMFonts.heading(.headline))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(gradeColor(mlService.currentGrade))
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }
                        }
                        
                        Divider()
                        
                        Text("Deteksi Defect (Poin SNI)")
                            .font(KODAMFonts.heading(.headline))
                        
                        // Show breakdown (e.g. grouped by defect)
                        let grouped = Dictionary(grouping: mlService.detectedBeans, by: { $0.classification })
                        let sortedGroups = grouped.sorted { $0.value.count > $1.value.count }.prefix(3)
                        
                        if sortedGroups.isEmpty {
                            Text("Arahkan kamera ke tumpukan biji kopi.")
                                .font(KODAMFonts.body(.caption))
                                .foregroundStyle(KODAMTheme.textTertiary)
                        } else {
                            ForEach(sortedGroups, id: \.key) { key, beans in
                                HStack {
                                    Circle()
                                        .fill(colorForDefect(key))
                                        .frame(width: 8, height: 8)
                                    Text(key.rawValue)
                                        .font(KODAMFonts.body(.caption))
                                    Spacer()
                                    Text("\(beans.count) biji")
                                        .font(KODAMFonts.body(.caption))
                                        .bold()
                                }
                            }
                        }
                    }
                }
                .padding()
                .padding(.bottom, 20)
            }
        }
        .onAppear {
            mlService.start()
        }
        .onDisappear {
            mlService.stop()
        }
        .sensoryFeedback(.impact, trigger: mlService.currentGrade)
    }
    
    private func colorForDefect(_ defect: CoffeeDefect) -> Color {
        if defect == CoffeeDefect.green { return KODAMTheme.emeraldGreen }
        if defect.sniPenaltyValue >= 2.0 { return KODAMTheme.destructiveRed }
        return KODAMTheme.amberGold
    }
    
    private func gradeColor(_ grade: SNIGrade) -> Color {
        switch grade {
        case .mutu1: return KODAMTheme.emeraldGreen
        case .mutu2, .mutu3: return KODAMTheme.amberGold
        case .mutu4, .mutu5: return .orange
        case .mutu6, .rejected: return KODAMTheme.destructiveRed
        }
    }
}

struct CameraPreviewView: UIViewRepresentable {
    let service: TwoStepBeanQualityDetectionService
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black
        
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.frame = view.frame
        service.setupCamera(previewLayer: previewLayer)
        
        view.layer.addSublayer(previewLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    BeanQualityScannerView()
}
