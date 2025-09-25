//
//  CameraView.swift
//  VisuallyImpaired
//
//  Created by aanya kungwani on 9/1/25.
//
import SwiftUI
import AVFoundation
import Vision
struct Seen: Identifiable {
    let id = UUID()
    let text: String
    let bbox: CGRect
}
final class ReaderVM: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    @Published var recent: Seen?
    @Published var speak = true
    
    private let session = AVCaptureSession()
    private let speech = AVSpeechSynthesizer()
    private var lastThing = " "
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    private var Skipframe = 0
    
    func start() {
        session.beginConfiguration()
        session.sessionPreset = .high
        guard
            let cam = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
            let input = try? AVCaptureDeviceInput(device: cam),
            session.canAddInput(input)
        else {
            print("No camera")
            return }
        session.addInput(input)
        
        let out = AVCaptureVideoDataOutput()
        out.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        out.setSampleBufferDelegate(self, queue: DispatchQueue(label: "frames"))
        guard session.canAddOutput(out) else { print("") ; return
        }
        session.addOutput(out)
        
        //if let c = out.connection(with: .video), c.isVideoRotationAngle{ c.videoRotationAngle = .portrait }
        
        session.commitConfiguration()
        previewLayer.session = session
        previewLayer.videoGravity = .resizeAspectFill
        session.startRunning()
    }
    
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        Skipframe = (Skipframe + 1) % 3
        guard Skipframe == 0,
              
                let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self else { return }
            
            let obs = (request.results as? [VNRecognizedTextObservation])?.prefix(1) ?? []
            guard let o = obs.first,
                  let top = o.topCandidates(1).first else { return }
            
            let seen = Seen(text: top.string, bbox: o.boundingBox)
            DispatchQueue.main.async
            { self.handle(seen)
            }
        }
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])
        try? handler.perform([request])
    }
    private func handle(_ seen: Seen) {
        recent = seen
        
        let area = seen.bbox.width * seen.bbox.height
        let close = area > 0.05
        let phrase = close ? "\(seen.text)  nearby" : "\(seen.text)"
        
        if speak, phrase != lastThing {
            lastThing = phrase
            let u = AVSpeechUtterance(string: phrase)
            speech.speak(u)
            
            if close {
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
        }
    }
}
struct LiveVisionSimpleView: View {
    @StateObject var vm = ReaderVM()
        
    var body : some View {
            
            ZStack(alignment: .topLeading) {
                CameraHost(layer: vm.previewLayer)
                    .ignoresSafeArea()
                Text(" ")
                
                VStack {
                    Spacer()
                    if let x = vm.recent {
                        Text(x.text + ( (x.bbox.width*x.bbox.height) > 0.05 ? " nearby ": "" ))
                            .font(.title)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        
                    }
                }
                
            }
            .onAppear { vm.start() }
        }
           
    }
    
struct CameraHost: UIViewRepresentable {
    let layer: AVCaptureVideoPreviewLayer
    
    func makeUIView(context: Context) -> UIView {
        let v = UIView()
        layer.frame = UIScreen.main.bounds
        v.layer.addSublayer(layer)
        return v
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        layer.frame = uiView.bounds
    }
}
    
            
                
        
        //struct CameraView: UIViewRepresentable {
        //    func makeUIView(context: Context) -> UIView {
        //        let view = UIView(frame: UIScreen.main.bounds)
        //
        //        let captureSession = AVCaptureSession()
        //        captureSession.sessionPreset = .photo
        //
        //        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return view }
        //        let videoInput: AVCaptureDeviceInput
        //
        //        do {
        //            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        //        } catch {
        //            return view
        //        }
        //
        //        if captureSession.canAddInput(videoInput) {
        //            captureSession.addInput(videoInput)
        //        } else {
        //            return view
        //        }
        //
        //        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //        previewLayer.frame = view.layer.bounds
        //        previewLayer.videoGravity = .resizeAspectFill
        //        view.layer.addSublayer(previewLayer)
        //
        //        captureSession.startRunning()
        //
        //        return view
        //    }
        //
        //    func updateUIView(_ uiView: UIView, context: Context) {}
        //}

