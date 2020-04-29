//
//  Home.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import VideoPlayer



private let videoURL = Bundle.main.url(forResource: "typing", withExtension: "mp4")


struct CategoryHome: View {
    
    @State private var showImagePicker: Bool = false
    
    @State private var image: Image? = nil
    
    @State private var play: Bool = true
    
    @State private var textView: UITextView!
    
    @State private var activityIndicator: UIActivityIndicatorView!
    
    var body: some View {
        
        ZStack{
            Color(hex: "000")
                .edgesIgnoringSafeArea(.all)
            
            VStack {

                
                VideoPlayer(url: videoURL!, play: $play)
                    .autoReplay(true)
                
                Button(action: {
                    
                    self.showImagePicker.toggle()
                    
                }) {
                    
                    Text("Open Camera")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(30)
                    .background(Color(hex: "242628"))
                    .cornerRadius(50)
                        .foregroundColor(Color(hex: "000"))
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color(hex: "242628"), lineWidth: 5)
                    )
                    
                    
                    
                }
                
                image?.resizable()
                
                Spacer()
                
                
            }
            if(showImagePicker) {
                
                ImageCaptureView(isShown: self.$showImagePicker, image: self.$image)
            
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
