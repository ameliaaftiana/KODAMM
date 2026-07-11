import Foundation
import Vision
import CoreML
import AVFoundation
import CoreImage
import Observation

// SNI 01-2907-2008 Defect Types and Penalties
enum CoffeeDefect: String, CaseIterable, Identifiable {
    case green = "Biji Normal"
    case fullBlack = "Biji Hitam"
    case partialBlack = "Biji Hitam Sebagian"
    case fullSour = "Biji Rusak/Busuk"
    case partialSour = "Biji Rusak/Busuk Sebagian"
    case fungus = "Biji Berjamur"
    case insectDamage = "Biji Berlubang"
    case broken = "Biji Pecah"
    case immature = "Biji Muda"
    case shell = "Kulit Tanduk"
    case unhulled = "Biji Gelondong"
    case withered = "Biji Keriput"
    case largeStick = "Ranting Besar"
    case mediumStick = "Ranting Sedang"
    case smallStick = "Ranting Kecil"
    case largeStone = "Batu Besar"
    case mediumStone = "Batu Sedang"
    case smallStone = "Batu Kecil"
    case soil = "Tanah"
    
    var id: String { rawValue }
    
    // SNI 01-2907-2008 penalty values per single occurrence or specific weight
    // This is a simplified point mapping based on standard SNI defect values
    var sniPenaltyValue: Double {
        switch self {
        case .green: return 0
        case .fullBlack: return 1.0
        case .partialBlack: return 0.5
        case .fullSour: return 1.0
        case .partialSour: return 0.5
        case .fungus: return 1.0 // Unsafe, high penalty
        case .insectDamage: return 0.1 // 10 beans = 1 point
        case .broken: return 0.2 // 5 beans = 1 point
        case .immature: return 0.2 // 5 beans = 1 point
        case .shell: return 0.5 // 2 shells = 1 point
        case .unhulled: return 1.0 // 1 bean = 1 point
        case .withered: return 0.2 // 5 beans = 1 point
        case .largeStick, .mediumStick, .smallStick: return 2.0 // Foreign matter
        case .largeStone, .mediumStone, .smallStone: return 5.0 // Foreign matter
        case .soil: return 5.0
        }
    }
    
    // Maps the raw English labels output by the CoreML model to our SNI defect types
    static func fromModelLabel(_ label: String) -> CoffeeDefect {
        switch label {
        case "Full Black": return .fullBlack
        case "Partial Black": return .partialBlack
        case "Full Sour": return .fullSour
        case "Partial Sour": return .partialSour
        case "Fungus Damange": return .fungus // Note: Matches the typo in the ML model
        case "Severe Insect Damange", "Slight Insect Damage": return .insectDamage
        case "Broken": return .broken
        case "Immature": return .immature
        case "Shell", "Husk": return .shell
        case "Dry Cherry": return .unhulled
        case "Withered": return .withered
        case "Green": return .green // "Green" means a healthy green coffee bean
        // Other labels like "Fade", "Floater", "Parchment" don't carry severe SNI penalties or map cleanly, so we default to normal or minor defect
        default: return .green
        }
    }
}

enum SNIGrade: String {
    case mutu1 = "Mutu 1" // Max 11 points
    case mutu2 = "Mutu 2" // 12-25 points
    case mutu3 = "Mutu 3" // 26-44 points
    case mutu4 = "Mutu 4" // 45-80 points
    case mutu5 = "Mutu 5" // 81-150 points
    case mutu6 = "Mutu 6" // 151-225 points
    case rejected = "Ditolak" // > 225 points
    
    static func grade(for points: Double) -> SNIGrade {
        switch points {
        case 0...11: return .mutu1
        case 12...25: return .mutu2
        case 26...44: return .mutu3
        case 45...80: return .mutu4
        case 81...150: return .mutu5
        case 151...225: return .mutu6
        default: return .rejected
        }
    }
}

struct DetectedBean {
    let boundingBox: CGRect
    var classification: CoffeeDefect
    var confidence: Float
}

@Observable
class TwoStepBeanQualityDetectionService: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    var detectedBeans: [DetectedBean] = []
    var totalBeansCounted: Int = 0
    var totalDefectPoints: Double = 0.0
    var currentGrade: SNIGrade = .mutu1
    var isRunning: Bool = false
    
    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureVideoDataOutput?
    
    // CoreML Models
    private var objectDetectionModel: VNCoreMLModel?
    private var classificationModel: VNCoreMLModel?
    
    override init() {
        super.init()
        setupModels()
    }
    
    private func setupModels() {
        do {
            // Load Object Detection Model (YOLO)
            let config = MLModelConfiguration()
            config.computeUnits = .all
            
            // Note: Replace with actual auto-generated class names when compiled
            if let objModelPath = Bundle.main.url(forResource: "Object Detection - KODAM", withExtension: "mlmodelc"),
               let rawObjModel = try? MLModel(contentsOf: objModelPath, configuration: config) {
                self.objectDetectionModel = try VNCoreMLModel(for: rawObjModel)
                print("Successfully loaded Object Detection model")
            } else {
                print("Failed to load Object Detection model from bundle. Will simulate if needed.")
            }
            
            if let classModelPath = Bundle.main.url(forResource: "Image Classification - KODAM", withExtension: "mlmodelc"),
               let rawClassModel = try? MLModel(contentsOf: classModelPath, configuration: config) {
                self.classificationModel = try VNCoreMLModel(for: rawClassModel)
                print("Successfully loaded Classification model")
            } else {
                 print("Failed to load Classification model from bundle. Will simulate if needed.")
            }
            
        } catch {
            print("Error initializing CoreML models: \(error)")
        }
    }
    
    func setupCamera(previewLayer: AVCaptureVideoPreviewLayer) {
        let session = AVCaptureSession()
        session.sessionPreset = .high
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
              let input = try? AVCaptureDeviceInput(device: device) else {
            print("Failed to get camera input")
            return
        }
        
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        output.alwaysDiscardsLateVideoFrames = true
        
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        
        self.captureSession = session
        self.videoOutput = output
    }
    
    func start() {
        guard let session = captureSession, !session.isRunning else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
        isRunning = true
    }
    
    func stop() {
        guard let session = captureSession, session.isRunning else { return }
        session.stopRunning()
        isRunning = false
    }
    
    // MARK: - Video Processing
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard isRunning else { return }
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // Skip frames if we are busy to maintain performance
        // Implement frame throttling if needed
        
        processFrame(pixelBuffer)
    }
    
    private func processFrame(_ pixelBuffer: CVPixelBuffer) {
        if objectDetectionModel == nil || classificationModel == nil {
             simulateDetection(pixelBuffer)
             return
        }

        // 1. Run Object Detection to find beans
        let request = VNCoreMLRequest(model: objectDetectionModel!) { [weak self] request, error in
            guard let self = self, let results = request.results as? [VNRecognizedObjectObservation] else { return }
            
            var currentDetectedBeans: [DetectedBean] = []
            
            // Process each detected bean bounding box
            for observation in results {
                let boundingBox = observation.boundingBox
                
                // Crop the image to the bounding box
                let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
                let croppedImage = ciImage.cropped(to: VNImageRectForNormalizedRect(boundingBox, Int(ciImage.extent.width), Int(ciImage.extent.height)))
                
                // 2. Run Classification on the cropped bean
                self.classifyBean(croppedImage: croppedImage, boundingBox: boundingBox) { classifiedBean in
                     if let bean = classifiedBean {
                         currentDetectedBeans.append(bean)
                     }
                }
            }
            
            // Update state on Main Thread
            DispatchQueue.main.async {
                self.detectedBeans = currentDetectedBeans
                self.updateMetrics()
            }
        }
        
        // Use .scaleFill to squash the entire image into the 480x480 model without cropping edges
        request.imageCropAndScaleOption = .scaleFill
        
        // Use orientation .right for portrait iPhone camera buffer
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: [:])
        try? handler.perform([request])
    }
    
    private func classifyBean(croppedImage: CIImage, boundingBox: CGRect, completion: @escaping (DetectedBean?) -> Void) {
        guard let model = classificationModel else {
            completion(nil)
            return
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let topResult = results.first else {
                completion(nil)
                return
            }
            
            // Map the identifier from the ML model's English labels back to our SNI enum.
            let defect = CoffeeDefect.fromModelLabel(topResult.identifier)
            
            let bean = DetectedBean(boundingBox: boundingBox, classification: defect, confidence: topResult.confidence)
            completion(bean)
        }
        
        // Use .scaleFill so the bean crop covers the entire 360x360 model
        request.imageCropAndScaleOption = .scaleFill
        
        let handler = VNImageRequestHandler(ciImage: croppedImage, options: [:])
        try? handler.perform([request])
    }
    
    // Fallback simulation if models are not loaded (e.g. running in Simulator without models)
    private func simulateDetection(_ pixelBuffer: CVPixelBuffer) {
         // Throttling simulation to avoid flooding UI
         Thread.sleep(forTimeInterval: 0.5)
         
         DispatchQueue.main.async {
             // Generate dummy bounding boxes
             self.detectedBeans = [
                 DetectedBean(boundingBox: CGRect(x: 0.2, y: 0.3, width: 0.1, height: 0.1), classification: .green, confidence: 0.95),
                 DetectedBean(boundingBox: CGRect(x: 0.5, y: 0.5, width: 0.12, height: 0.11), classification: .partialBlack, confidence: 0.88),
                 DetectedBean(boundingBox: CGRect(x: 0.7, y: 0.2, width: 0.08, height: 0.09), classification: .insectDamage, confidence: 0.91)
             ]
             self.updateMetrics()
         }
    }
    
    private func updateMetrics() {
        totalBeansCounted = detectedBeans.count
        
        totalDefectPoints = detectedBeans.reduce(0.0) { result, bean in
            result + bean.classification.sniPenaltyValue
        }
        
        // Scale up points as if it was a 300g sample.
        // Assuming ~2000 beans in 300g for Arabica.
        // If we see 10 beans and get 1 point, in 2000 beans it would be 200 points.
        // This is a naive scaling for demonstration.
        let scaledPoints = totalBeansCounted > 0 ? (totalDefectPoints / Double(totalBeansCounted)) * 2000.0 : 0
        
        let newGrade = SNIGrade.grade(for: scaledPoints)
        
        // Trigger haptic if grade changes
        if newGrade != currentGrade {
            self.currentGrade = newGrade
            // UI Layer will handle haptic based on this change
        }
    }
}
