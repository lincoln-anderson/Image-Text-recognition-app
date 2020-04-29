//
//  ImagePicker.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/14/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import Foundation
import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
@Binding var isShown: Bool
@Binding var image: Image?
init(isShown: Binding<Bool>, image: Binding<Image?>) {
  _isShown = isShown
  _image = image
}
    
    func imagePickerController(_ picker: UIImagePickerController,
                  didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
       image = Image(uiImage: unwrapImage)
       isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        isShown = false
        
    }
    
    
}

struct ImagePicker {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> ImagePickerCoordinator {
        
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
        
    }
    
    
}
