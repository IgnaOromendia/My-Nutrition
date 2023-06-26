//
//  Constants.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

// Typealias

typealias Week = Array<Day>

// Enums

enum FoodType: Int, Codable {
    case none           = -1
    case protein        = 0
    case carboohydrates = 1
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
