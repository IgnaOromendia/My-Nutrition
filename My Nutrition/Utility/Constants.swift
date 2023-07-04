//
//  Constants.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation
import SwiftUI

// Variables
var today = Date()

// Typealias

typealias Week = Array<Day>

// Enums

enum FoodType: Int, Codable {
    case none           = -1
    case protein        = 0
    case carbohydrates = 1
    case vegetables     = 2
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

enum DayMoment: Int, Codable {
    case breakfast   = 0
    case collation1  = 1
    case lunch       = 2
    case snack       = 3
    case collation2  = 4
    case dinner      = 5
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
