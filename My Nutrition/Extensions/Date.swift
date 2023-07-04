//
//  Date.swift
//  My Nutrition
//
//  Created by Igna on 04/07/2023.
//

import Foundation

extension Date {
    
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// Number of week day
    var weekDay: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    /// Returns a string date with this fomrat: 12/12/2021
    var comparableDate: String {
        get {
            let date = Calendar.current.dateComponents([.day,.month,.year], from: self)
            return "\(date.day ?? -1)/\(date.month ?? -1)/\(date.year ?? -1)"
        }
    }
    
    /// Returns a date for a file name, 9-12-18
    var storageDate: String {
        get {
            let date = Calendar.current.dateComponents([.day,.month,.year], from: self)
            return "\(date.day ?? -1)-\(date.month ?? -1)-\(date.year ?? -1)"
        }
    }
    
    /// Returns string date 26/03
    var dayMonthDate: String {
        get {
            let date = Calendar.current.dateComponents([.day,.month], from: self)
            if let day = date.day, let month = date.month {
                let finalDay = day < 10 ? "0\(day)/" : "\(day)/"
                let finalMonth = month < 10 ? "0\(month)" : "\(month)"
                return finalDay + finalMonth
            }
            return "Error"
        }
    }
    
    /// Returns the date but if it's equal to today, retruns "today" and similar with "yesterday"
    var prettyDate: String {
        get {
            if self.comparableDate == Date().comparableDate {
                return "Today"
            } else if self.comparableDate == (Date() - TimeInterval(86400)).comparableDate {
                return "Yesterady"
            } else {
                return self.dayMonthDate
            }
        }
    }
    
    var moment: DayMoment {
        // TODO: WOULD BE NICE IF IT LEARNS FROM ROUTINE THE OF THE USERS
        switch Date().hour {
        case 0..<5:
            return .dinner
        case 5..<11:
            return .breakfast
        case 11..<12:
            return .collation1
        case 12..<15:
            return .lunch
        case 15..<16:
            return .collation2
        case 16..<19:
            return .snack
        case 19..<24:
            return .dinner
        default:
            return .dinner
        }
    }
    
}
