//
//  PageView.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import VideoPlayer

struct PageView<Page: View>: View {
    
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        
        self.viewControllers = views.map {UIHostingController(rootView: $0)}
        
    }
    
    var body: some View {
        
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            Text("Current page: \(currentPage)")
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(CategoryHome)
    }
}
