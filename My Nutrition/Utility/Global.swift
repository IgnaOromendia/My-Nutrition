//
//  Global.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation

func initWeek() -> Week{
    let dayDifference = oneDay * Double(today.weekDay)
    var res: Week = []
    
    for i in 0..<today.weekDay {
        res.append(Day(date: (today - dayDifference) + oneDay * Double(i)))
    }
    
    for i in 0..<(7 - today.weekDay) {
        res.append(Day(date: today + oneDay * Double(i)))
    }
    
    return res
}

// Variables
var current_week: Week = initWeek()    // This array has lenght = 7 always
var weeks: [String:Week] = [current_week[0].date().storageDate:current_week]
var goals: [Goal] = []
