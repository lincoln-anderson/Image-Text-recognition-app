//
//  ScannedText.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import Combine

class ScannedText: ObservableObject, Identifiable {
    
    let objectWillChange = PassthroughSubject<ScannedText, Never>()
    
    var text: String = "" {
        
        willSet {
            
            objectWillChange.send(self)
            
        }
        
    }
    
}
