//
//  Day.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation

/*
 Breakfast  = 0
 collation1 = 1
 Lunch      = 2
 snack      = 3
 collation2 = 4
 Dinner     = 5
 */

class Day: Equatable, Codable {
    
    // Variables
    private var _date: Date
    private var _meals: [Meal] = []
    
    // Constructor
    init(meals: [Meal], date: Date) {
        _date = date
        _meals = meals
    }
    
    convenience init(date: Date) {
        let m: [Meal] = [Meal(), Meal(), Meal(), Meal(), Meal(), Meal()]
        self.init(meals: m, date: date)
    }
    
    // Equtable
    static func == (lhs: Day, rhs: Day) -> Bool {
        return lhs._date == rhs._date && lhs._meals == rhs._meals
    }
    
    // MARK: - GET
    
    /// Returns date
    func date() -> Date {
        return _date
    }
    
    /// Returns specified meal
    func mealFrom(_ moment: DayMoment) -> Meal {
        return _meals[moment.rawValue]
    }
    
    /// Return all meals
    func all_meals() -> [Meal] {
        return _meals
    }
    
    /// Returns all meals non empty
    func all_meals_with_food() -> [Meal] {
        var res: [Meal] = []
        for _meal in _meals {
            if _meal.has_food() {res.append(_meal)}
        }
        return res
    }
    
    // MARK: - SET
    func add_meal(_ meal: Meal, on moment: DayMoment) {
        _meals[moment.rawValue] = meal
    }
    
    // MARK: - DELETE
    
    /// Delete one meal at the moment specified
    func delete_meal(on moment: DayMoment) {
        _meals[moment.rawValue].delete_all()
    }
    
    /// Delete all meals
    func delete_all_meal() {
        for i in 0..._meals.count {
            _meals[i].delete_all()
        }
    }
    
    
}
