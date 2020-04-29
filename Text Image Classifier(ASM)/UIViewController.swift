//
// PageViewController.swift
//  Text Image Classifier(ASM)
//
//  Created by lincoln anderson on 4/29/20.
//  Copyright © 2020 lincoln anderson. All rights reserved.
//

import SwiftUI
import UIKit
import Vision
import VisionKit


struct PageViewController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        
        let PageViewController = UIPageViewController (
            
            transitionStyle: .scroll,
            
            navigationOrientation: .horizontal)
            
        return PageViewController
        
        
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        
        pageViewController.setViewControllers(
            
            [controllers[0]], direction: .forward, animated: true)
        
    }
    
    
}

