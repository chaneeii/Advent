//
//  Date.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/04/29.
//

import SwiftUI

//  Gift Model
// 0 : 시작점
// 1 - 24 :
// 25 : 크리스마스
// >> 다음해로 넘어가면 리셋
struct Gift: Identifiable, Hashable, Codable {
//    var id = UUID().uuidString
    var id: String
    var day: Int
    var hint: String // 편지 힌트 메세지
    var type: String //
    var image: String
    var giftImage: Image {
        Image(image)
    }
    var comment: String
    var title: String
    var description: String
    
}
