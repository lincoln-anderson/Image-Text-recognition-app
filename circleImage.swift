//
//  circleImage.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/10/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct circleImage: View {
    var body: some View {
        Image("Helvetica").resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(hex: "000"), lineWidth: 4))
        .scaledToFit()
        
        
    }
}

struct circleImage_Previews: PreviewProvider {
    static var previews: some View {
        circleImage()
    }
}
