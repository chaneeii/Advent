//
//  ViewExtension.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/04/29.
//

import SwiftUI

// Screen Bounds... 스크린 경계값
extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // SWIFTUI-VIEW TO IMAGE
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
}

