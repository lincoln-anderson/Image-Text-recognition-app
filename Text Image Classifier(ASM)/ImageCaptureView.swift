//
//  ImageCaptureView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/14/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct ImageCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    
    
    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image)
    }
}

struct ImageCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCaptureView(showImagePicker: .constant(false), image: .constant(Image("")))
    }
}
