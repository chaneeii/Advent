//
//  BlurView.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/04.
//

import SwiftUI

/** 모달 뒤 블러뷰 **/
struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}
