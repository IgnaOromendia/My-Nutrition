//
//  My_NutritionApp.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import SwiftUI
import Foundation

// Variables
var current_week: Week = []    // This array has lenght = 7 always
var weeks: [String:Week] = [:]

@main
struct My_NutritionApp: App {
    
    init() {
        weeks = StorageManager.readData()
        
        print(weeks)
        
        if let thisWeek = weeks[Date.now.weekMonday.storageDate] {
            current_week = thisWeek
        } else {
            print("Creating new week")
            current_week = initWeek()
            weeks.updateValue(current_week, forKey: current_week.key())
        }
        
        print(weeks)
        print(current_week)
    }
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

fileprivate func initWeek() -> Week{
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
