//
//  ShareSheet.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/05/04.
//

import SwiftUI

/** 공유하기 **/
struct ShareSheet: UIViewControllerRepresentable {
    
    // the data you need to share
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
