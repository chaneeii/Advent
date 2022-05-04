//
//  ExtensionColor.swift
//  Advent
//
//  Created by Chanhee Jeong on 2022/04/28.
//

import SwiftUI

extension Color {
    
    init(hex: String){
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
        
    }
    
    
    /** CUSTOMISED COLOR **/
    
    /*
    // 1. HEX 사용법
    static let grayC5 = Color(hex: "#c5c5c5")
    // 2. UIColor 사용법
    static let background = Color(UIColor.systemBlue)
    // 3. 시스템 이름으로 된 컬러 사용법
    static let bieberPeach = Color("peach")
    // 4. 프라이머리 컬러에 오퍼시티까지 !
    static let primaryShadoe = Color.primary.opacity(0.2)
     */
    
    
    // ADVENT COLOR
    static let adventPeach = Color(hex: "#FA6E5D")
    static let adventRed = Color(hex: "#D03832")
    static let adventGreen = Color(hex: "#42A266") // 연한
    static let adventGreen2 = Color(hex: "#238C67") // 중간
    static let adventGreen3 = Color(hex: "#2F616F") // 찐
    static let adventNavy = Color(hex: "#2E3354") // 배경  101221
    static let grayC5 = Color(hex: "#c5c5c5")
    static let gray40 = Color(hex: "#404040")
    
}
