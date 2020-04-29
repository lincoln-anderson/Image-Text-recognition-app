//
//  ImageTextView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct ImageTextView: View {
    
    @Binding var image: Image?
    
    var body: some View {
        self.image?.resizable()
    }
}
