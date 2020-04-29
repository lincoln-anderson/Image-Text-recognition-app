//
//  ImageCaptureView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/14/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import UIKit
import VisionKit
import Combine

struct ImageCaptureView: UIViewControllerRepresentable {
    
    @Binding var scannedText: String
    
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(scannedText: $scannedText)
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImageCaptureView>) -> VNDocumentCameraViewController {
        
        let documentCameraViewController = VNDocumentCameraViewController()
        
        documentCameraViewController.delegate = context.coordinator
        
        return documentCameraViewController
        
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ImageCaptureView>) {
        
        
        
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        var scannedText: Binding<String>
        
        private let textRecognizer: TextRecognizer
        
        init(scannedText: Binding<String>) {
            
            self.scannedText = scannedText
            
            textRecognizer = TextRecognizer(scannedText: scannedText)
            
        }
        
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            
            var images = [CGImage]()
            
            for pageIndex in 0 ..< scan.pageCount {
                
                let image = scan.imageOfPage(at: pageIndex)
                
                if let cgImage = image.cgImage {
                    
                    images.append(cgImage)
                    
                }
            }
            
            textRecognizer.recognizeText(from: images)
            
            controller.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
    
}
