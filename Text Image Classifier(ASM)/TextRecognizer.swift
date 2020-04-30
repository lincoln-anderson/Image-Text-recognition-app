//
//  TextRecognizer.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import Vision
import VisionKit
import Combine

public struct TextRecognizer {
    
    @Binding var scannedText: String
    
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    func recognizeText(from images: [CGImage]) {
        
        self.scannedText = ""
        
        var tmp = ""
        
        
        
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                
                print("The observations are of an unexpected type")
                
                return
                
            }
            
            let maximumCandidates = 1
            
            for observation in observations {
                
                guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
                
                tmp += candidate.string + "\n"
                
            }
        }
        
        textRecognitionRequest.recognitionLevel = .accurate
        
        for image in images {
            
            let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
            
            do {
                
                try requestHandler.perform([textRecognitionRequest])
                
            } catch {
                
                print(error)
                
            }
            
            tmp += "\n\n"
            
        }
        
        self.scannedText = tmp
        
        
    }
    
    
    
}
