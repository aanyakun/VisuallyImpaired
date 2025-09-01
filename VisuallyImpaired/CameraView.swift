//
//  CameraView.swift
//  VisuallyImpaired
//
//  Created by aanya kungwani on 9/1/25.
//
import SwiftUI
import AVFoundation



struct CameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)

        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo

        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return view }
        let videoInput: AVCaptureDeviceInput

        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return view
        }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return view
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
