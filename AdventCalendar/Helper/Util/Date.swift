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


extension Date {
    /**
     # dateCompare
     - Parameters:
        - fromDate: 비교 대상 D
     ate
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
    
    // DATE -> STRING
    public func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "GMT") // GMT
        return dateFormatter.string(from: self)
        
    }
    
    
}

extension String {
    
    func stringToDate() -> Date? { // "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "GMT") // GMT
        if let date = dateFormatter.date(from: self){
            return date
        } else{
            return nil
        }
        
    }
}


 
////  현재 날짜와 date 날짜 비교
//let dateTarget = "2022.04.20 kk:mm:ss"
//Date().dateCompare(fromDate: dateTarget.stringToDate() )


//  date1 날짜와 date2 날짜 비교
// date1.dateCompare(fromDate: date2)
 
 
 

// 2자리 포멧팅
//let number: Int = 7
//
//let str = String(format: "%02d", number)
//
//print(str) // 07
