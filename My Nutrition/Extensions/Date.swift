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
        let day = Calendar.current.component(.weekday, from: self) - 2
        return day == -1 ? 6 : day
    }
    
    /// Returns a string date with this fomrat: 12/12/2021
    var comparableDate: String {
        let date = Calendar.current.dateComponents([.day,.month,.year], from: self)
        return "\(date.day ?? -1)/\(date.month ?? -1)/\(date.year ?? -1)"
    }
    
    /// Returns a date for a file name, 9-12-2018
    var storageDate: String {
        let date = Calendar.current.dateComponents([.day,.month,.year], from: self)
        return "\(date.day ?? -1)-\(date.month ?? -1)-\(date.year ?? -1)"
    }
    
    /// Returns string date 26/03
    var dayMonthDate: String {
        let date = Calendar.current.dateComponents([.day,.month], from: self)
        if let day = date.day, let month = date.month {
            let finalDay = day < 10 ? "0\(day)/" : "\(day)/"
            let finalMonth = month < 10 ? "0\(month)" : "\(month)"
            return finalDay + finalMonth
        }
        return "Error"
    }
    
    /// Returns the date but if it's equal to today, retruns "today" and similar with "yesterday"
    var prettyDate: String {
        if self.comparableDate == today.comparableDate {
            return "Today"
        } else if self.comparableDate == (today - oneDay).comparableDate {
            return "Yesterady"
        } else if self.comparableDate == (today + oneDay).comparableDate {
            return "Tomorrow"
        } else {
            return self.dayMonthDate
        }
    }
    
    /// Return a moment depending on the hour
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
    
    /// Returns the monday of the week
    var weekMonday: Date {
        return self - (oneDay * Double(self.weekDay))
    }
    
    /// Returns the result of incrementing this date by the input given
    func increment(by days: Int) -> Date {
        return self + (oneDay * Double(days))
    }
    
}
