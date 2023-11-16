//
//  MainViewController.swift
//  MetalCamera
//
//  Created by Erick Ribeiro on 16/11/23.
//  Copyright © 2023 GS. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia

class MainViewController: UIViewController {
    
    private var metalView: MetalView!
    private var videoCapture: VideoCapture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpCamera()
    }
    
    private func setUpViews() {
        metalView = MetalView()
        metalView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(metalView)
        
        NSLayoutConstraint.activate([
            metalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            metalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            metalView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            metalView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        metalView.drawableSize = metalView.bounds.size

    }
    
    private func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.setUp(sessionPreset: AVCaptureSession.Preset.photo, frameRate: 60) { success in
            if success {
                self.videoCapture.start()
            }
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension MainViewController: VideoCaptureDelegate {
    
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?, timestamp: CMTime) {
        DispatchQueue.main.async {
            self.metalView.pixelBuffer = pixelBuffer
        }
    }
}
