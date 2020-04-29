//
//  ContentView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 2/7/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import VideoPlayer



private let videoURL = Bundle.main.url(forResource: "typing", withExtension: "mp4")


struct ContentView: View {
    
    @ObservedObject var scannedText: ScannedText = ScannedText()
    
    @State private var play: Bool = true
    
    
    var body: some View {
        
        
        NavigationView {
            
            VStack{
                
                VideoPlayer(url: videoURL!, play: $play)
                .autoReplay(true)
                
                Text(scannedText.text)
                    .lineLimit(nil)
                
                Spacer()
                
                NavigationLink(destination: ImageCaptureView(scannedText: $scannedText.text)) {
                    
                    Text("Scan for text")
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
                
                
            }
            Color(hex: "000")
            .edgesIgnoringSafeArea(.all)
        }
        
        
    }
        
            
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
