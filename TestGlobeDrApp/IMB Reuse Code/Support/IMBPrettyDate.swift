//
//  IMBPrettyDate.swift
//  Imbaggaarm
//
//  Created by Tai Duong on 4/11/17.
//  Copyright © 2017 Tai Duong. All rights reserved.
//

import UIKit

class IMBPrettyDate {
    
    static func format(duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        
        formatter.calendar = Calendar.current
        
        return formatter.string(from: duration)!
    }
    
    private static var prettyPrintedDateFormatter: DateFormatter = {
        let temp = DateFormatter()
        temp.calendar = Calendar.current
        temp.dateFormat = "dd • MMMM • yyyy"
        return temp
    }()
    
    private static var fullDateFormatter: DateFormatter = {
        let temp = DateFormatter()
        temp.calendar = Calendar.current
        temp.dateFormat = "dd • MM • yyyy HH:mm:ss"
        return temp
    }()
    
    static func handleGetFormatDateOfPost(datePost: Date, showFullDate: Bool = false) -> String {
        let duration = Date().timeIntervalSince(datePost)
        let result = format(duration: duration)
        
        //print(result)
        if duration < 86400 {
            if duration < 60 {
                return "Vừa xong"
            }
            return result + " trước"
        } else {
            if duration > 86400 * 365 {
                return prettyPrintedDateFormatter.string(from: datePost)
            } else {
                if !showFullDate {
                    return Calendar.current.component(.day
                        , from: datePost).description + " tháng " + Calendar.current.component(.month, from: datePost).description
                }
                return fullDateFormatter.string(from: datePost)
            }
        }
    }
}
