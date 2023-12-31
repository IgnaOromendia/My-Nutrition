//
//  Constants.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation
import SwiftUI

// Variables
let today = Date()
let oneDay: TimeInterval = 86400

// Images
let shareImage = "square.and.arrow.up"
let calendarImage = "calendar"

// Typealias
typealias Week = Array<Day>

// File name
let masterFileName = "MyNutrtionData"

// Enums
enum GoalType: Int, Codable {
    case A = 0
    case B = 1
}

enum FoodType: Int, Codable {
    case none           = -1
    case protein        = 0
    case carbohydrates  = 1
    case vegetables     = 2
}

enum DayMoment: Int, Codable {
    case breakfast   = 0
    case collation1  = 1
    case lunch       = 2
    case snack       = 3
    case collation2  = 4
    case dinner      = 5
}


// Enum Funcs
func passFoodTypeToString(_ type: FoodType) -> String {
    switch type {
    case .protein:
        return "Protein"
    case .carbohydrates:
        return "Carbohydrates"
    case .vegetables:
        return "Vegetables"
    case .none:
        return "Nonde"
    }
}

func colorFoodType(_ type: FoodType) -> (Color,Color){ // Background, TextColor
    switch type {
    case .protein:
        return (.orange, .white)
    case .carbohydrates:
        return (.yellow, .black)
    case .vegetables:
        return (.green, .white)
    default:
        return (.black, .white)
    }
}

func passMomentToString(_ moment: DayMoment) -> String {
    switch moment {
    case .breakfast:
        return "Breakfast"
    case .collation1:
        return "Collation"
    case .lunch:
        return "Lunch"
    case .snack:
        return "Snack"
    case .collation2:
        return "Collation"
    case .dinner:
        return "Dinner"
    }
}
