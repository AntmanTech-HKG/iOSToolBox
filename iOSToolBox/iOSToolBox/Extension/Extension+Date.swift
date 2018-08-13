//
//  Extension+Date.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import Foundation
import DateToolsSwift
import Localize_Swift

extension Date {
    func daySuffix() -> String {
        let calendar = NSCalendar.current
        let dayOfMonth = calendar.component(.day, from: self)

        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }

    var timeStampInMilliSecond: Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    var timeStampInSecond: Int {
        return Int((self.timeIntervalSince1970).rounded())
    }

    init(_ timeinterval: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(timeinterval))
    }

    func formatToDayOnly() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }

    func formattedDate() -> String {
        var format = "d'\(self.daySuffix())' MMMM yyyy"
        if Localize.currentLanguage() != "en" {
            format = "yyyy年 MM月 d日"
        }
        guard let locale = NSLocale(localeIdentifier: Localize.currentLanguage()) as Locale? else { return "" }
        return self.format(with: format, locale: locale)
    }
}
