//
//  DateUtil.swift
//  Covid19App
//
//  Created by oleg on 08.12.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

class DateUtil {
    static func isTheSameDay(comparedDateInMilliseconds: Int) -> Bool {
        let today = Date()
        let lastSyncDate = Date(milliseconds: comparedDateInMilliseconds)
        let result = NSCalendar.current.compare(today, to: lastSyncDate, toGranularity: .day)
        return result == .orderedSame
    }
    
}

extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
}
