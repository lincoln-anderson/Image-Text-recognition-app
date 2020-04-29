//
//  ImageTextController.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import UIKit
import Vision
import VisionKit

class ImageTextController {
    
    private var image: Image?
    
    private var requests = [VNRequest]()
    
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue",
                                                         qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    private var resultingText = ""
    
    init(image: Image?) {
        self.image = image
    }
    
    private func setupVision() {
        
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                
                print("the observations are of an unexpected type")
                
                return
                
            }
            
            let maximumCandidates = 1
            
            for observation in observations {
                
                guard let candidate = observation.topCandidates(maximumCandidates).first else {continue}
                
                self.resultingText += candidate.string + "\n"
                
            }
            
        }
        
        textRecognitionRequest.recognitionLevel = .accurate
        
        self.requests = [textRecognitionRequest]
        
    }
    
    private func scanReceipts(_ sender: UIControl?) {
        
        let docum
        
        
    }
    
    
    
    
    
}
