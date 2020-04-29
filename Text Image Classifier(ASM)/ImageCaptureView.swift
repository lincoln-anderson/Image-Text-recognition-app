//
//  ImageCaptureView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/14/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct ImageCaptureView {
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?

    func makeCoordinator() -> ImagePickerCoordinator {
      return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }
}

extension ImageCaptureView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImageCaptureView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImageCaptureView>) {
        
    }
}

struct ImageCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
