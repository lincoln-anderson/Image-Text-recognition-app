//
//  ContentView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 2/7/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import VideoPlayer


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

private let videoURL = Bundle.main.url(forResource: "typing", withExtension: "mp4")


struct ContentView: View {
    
    @State private var showImagePicker: Bool = false
    
    @State private var image: Image? = nil
    
    @State private var play: Bool = true
    
    var body: some View {
        
        ZStack{
            Color(hex: "000")
                .edgesIgnoringSafeArea(.all)
            
            VStack {

                
                VideoPlayer(url: videoURL!, play: $play)
                    .autoReplay(true)
                
                Button(action: {
                    
                    self.showImagePicker = true
                    
                }) {
                    
                    Text("Open Camera")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(Color(hex: "242628"))
                    .cornerRadius(40)
                        .foregroundColor(Color(hex: "000"))
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(hex: "242628"), lineWidth: 5)
                    )
                    
                    
                    
                }
                
                Spacer()
                
                
            }.sheet(isPresented: self.$showImagePicker) {
                
                ImageCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            
            }
            
        }
        
        
    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
