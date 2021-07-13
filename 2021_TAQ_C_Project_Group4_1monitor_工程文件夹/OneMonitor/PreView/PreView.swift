//
//  PreView.swift
//  learning
//
//  Created by 衍则 on 2021/5/28.
//
import SwiftUI
import AppKit
import AVFoundation

let pr = PreviewView()

class PreviewView: NSView, AVCapturePhotoCaptureDelegate {
    private var captureSession: AVCaptureSession?
    private var photoOutput: AVCapturePhotoOutput?
    init() {
        super.init(frame: .zero)

        var allowedAccess = false
        let blocker = DispatchGroup()
        blocker.enter()
        AVCaptureDevice.requestAccess(for: .video) { flag in
            allowedAccess = flag
            blocker.leave()
        }
        blocker.wait()

        if !allowedAccess {
            print("!!! NO ACCESS TO CAMERA")
            return
        }


        let session = AVCaptureSession()
        session.beginConfiguration()


        let videoDevice = AVCaptureDevice.default(for: .video)

        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            session.canAddInput(videoDeviceInput)
            else { return }
        session.addInput(videoDeviceInput)
        session.commitConfiguration()
        self.captureSession = session

        photoOutput = AVCapturePhotoOutput()
        guard captureSession!.canAddOutput(photoOutput!) else { return }
        captureSession!.sessionPreset = .photo
        captureSession!.addOutput(photoOutput!)
        captureSession!.commitConfiguration()

        self.wantsLayer = true
        self.layer = AVCaptureVideoPreviewLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }

    override func viewDidMoveToSuperview() { // on iOS .didMoveToSuperview
        super.viewDidMoveToSuperview()

        if nil != self.superview {
            self.videoPreviewLayer.session = self.captureSession
            self.videoPreviewLayer.videoGravity = .resizeAspect
            self.captureSession?.startRunning()
        } else {
            self.captureSession?.stopRunning()
        }
    }
    func snap(){
        let settings = AVCapturePhotoSettings(format: [
                   AVVideoCodecKey : AVVideoCodecType.jpeg
               ])
        captureSession!.startRunning()
        photoOutput!.capturePhoto(with: settings, delegate: self)
        
    }
}


struct PreviewHolder: NSViewRepresentable {
    func makeNSView(context: NSViewRepresentableContext<PreviewHolder>) -> PreviewView {
       pr
    }

    func updateNSView(_ uiView: PreviewView, context: NSViewRepresentableContext<PreviewHolder>) {
    }

    typealias NSViewType = PreviewView
}

struct DemoPreviewLayer: View {
    var body: some View {
        VStack {
            PreviewHolder()
                .mask(Circle())
        }.frame(width: 400, height: 400)
    }
}

struct DemoPreviewLayer_Previews: PreviewProvider {
    static var previews: some View {
        DemoPreviewLayer()
    }
}

