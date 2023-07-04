//
//  Global.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation

func initWeek() -> Week{
    var res: Week = []
    for _ in 0..<7 {
        res.append(Day(date: Date()))
    }
    return res
}

// Variables
var current_week: Week = initWeek()    // This array has lenght = 7 always
var weeks: [String:Week] = [:]
