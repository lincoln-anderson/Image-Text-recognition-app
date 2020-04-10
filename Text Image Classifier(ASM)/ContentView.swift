//
//  ContentView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 2/7/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            VStack(alignment: .leading) {
                offset(x: 10, y: 10)
                Text("Text Recognition")
                    .font(.title)
                    .foregroundColor(.black)
                HStack {
                    Text("Machine Learning Project")
                        .font(.subheadline)
                    Spacer()
                    Text("LAVA")
                        .font(.subheadline)
                }
                
            }
            .padding()
            
            circleImage()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
