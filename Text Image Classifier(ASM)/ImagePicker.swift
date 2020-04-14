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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let imageFromUI = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        image = Image(uiImage: imageFromUI)
        
        isShown = false
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        isShown = false
        
    }
    
    
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        //picker.sourceType = .camera
        
        return picker
        
    }
    
    
}
