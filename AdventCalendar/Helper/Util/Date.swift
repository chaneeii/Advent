//
//  Date.swift
//  AdventCalendar
//
//  Created by Chanhee Jeong on 2022/04/30.
//

import SwiftUI

func getNowDateTime24() -> String {
    let nowDate = Date() // 현재의 Date 날짜 및 시간
    let dateFormatter = DateFormatter() // Date 포맷 객체 선언
    dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
    
    dateFormatter.dateFormat = "yyyy.MM.dd kk:mm:ss E요일" // Date 포맷 타입 지정
    let date_string = dateFormatter.string(from: nowDate) // 포맷된 형식 문자열로 반환

    return date_string
}


// dd 반환
func getNowDate() -> Int {
    let nowDate = Date() // 현재의 Date 날짜 및 시간
    let dateFormatter = DateFormatter() // Date 포맷 객체 선언
    dateFormatter.locale = Locale(identifier: "ko") // 한국 지정
    
    dateFormatter.dateFormat = "dd" // Date 포맷 타입 지정
    let date_string = dateFormatter.string(from: nowDate) // 포맷된 형식 문자열로 반환

    return Int(date_string) ?? 0
}


extension Date {
    /**
     # dateCompare
     - Parameters:
        - fromDate: 비교 대상 Date
     - Note: 두 날짜간 비교해서 과거(Future)/현재(Same)/미래(Past) 반환
    */
    public func dateCompare(fromDate: Date) -> String {
        var strDateMessage:String = ""
        let result:ComparisonResult = self.compare(fromDate)
        switch result {
        case .orderedAscending:
            strDateMessage = "Future"
            break
        case .orderedDescending:
            strDateMessage = "Past"
            break
        case .orderedSame:
            strDateMessage = "Same"
            break
        default:
            strDateMessage = "Error"
            break
        }
        return strDateMessage
    }
    
}

/*
 
 // 현재 날짜와 date 날짜 비교
 Date().dateCompare(fromDate: date)


 // date1 날짜와 date2 날짜 비교
 date1.dateCompare(fromDate: date2)
 
 
 */
