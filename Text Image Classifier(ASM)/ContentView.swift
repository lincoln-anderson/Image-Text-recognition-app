//
//  ContentView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 2/7/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showImagePicker: Bool = false
    
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            
            Text("Image Text Recognition")
            .fontWeight(.bold)
            .font(.title)
            .padding()
            .cornerRadius(20)
            .foregroundColor(.blue)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.blue, lineWidth: 5)
            )
            
            circleImage()
                .padding(5)
            
            Button(action: {
                
                self.showImagePicker = true
                
            }) {
                
                Text("Open Camera")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.blue)
                .cornerRadius(40)
                .foregroundColor(.white)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.blue, lineWidth: 5)
                )
                
                
                
            }
            
            
        }.sheet(isPresented: self.$showImagePicker) {
            
            ImageCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
