//
//  String+Extension.swift
//
//
//  Created by Valentie on 23/6/2567 BE.
//

import Foundation

public func formatDate(from isoDateString: String) -> String? {
    let isoDateFormatter = ISO8601DateFormatter()
    isoDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    if let date = isoDateFormatter.date(from: isoDateString) {
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MMM dd, hh:mm a"
        displayFormatter.timeZone = TimeZone.current
        
        let formattedDate = displayFormatter.string(from: date)
        return formattedDate
    } else {
        return nil
    }
}
