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

class Day: Equatable, Codable, Identifiable, CustomStringConvertible {
    
    // Variables
    let id                      :String
    private var _date           :Date
    private var _meals          :[Meal] = []
    private var proteinPer      :Int
    private var carbohdratesPer :Int
    private var vegetablesPer   :Int
    
    // Constructor
    init(meals: [Meal], date: Date) {
        id = UUID().uuidString
        _date = date
        _meals = meals
        proteinPer = 0
        carbohdratesPer = 0
        vegetablesPer = 0
    }
    
    convenience init(date: Date) {
        let m: [Meal] = [Meal(moment: .breakfast),
                         Meal(moment: .collation1),
                         Meal(moment: .lunch),
                         Meal(moment: .collation2),
                         Meal(moment: .snack),
                         Meal(moment: .dinner)]
        self.init(meals: m, date: date)
    }
    
    var description: String {
        return "\(_date.dayMonthDate)"
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
    func allMeals() -> [Meal] {
        return _meals
    }
    
    /// Returns all meals non empty
    func allMealsWithFood() -> [Meal] {
        var res: [Meal] = []
        for _meal in _meals {
            if _meal.has_food() {res.append(_meal)}
        }
        return res
    }
    
    /// Returns de percentage requested
    func foodPercentage(of type:FoodType) -> Int {
        switch type {
        case .protein:
            return proteinPer
        case .carbohydrates:
            return carbohdratesPer
        case .vegetables:
            return vegetablesPer
        case .none:
            return 0
        }
    }
    
    // MARK: - SET
    func addMeal(_ meal: Meal, on moment: DayMoment) {
        _meals[moment.rawValue] = meal
        updatePercentages()
    }
    
    func addFood(_ food: Food, on moment: DayMoment) {
        _meals[moment.rawValue].addFood(food)
        updatePercentages()
    }
    
    // MARK: - DELETE
    
    /// Delete one meal at the moment specified
    func deleteMeal(on moment: DayMoment) {
        _meals[moment.rawValue].deleteAll()
        updatePercentages()
    }
    
    /// Delete all meals
    func deleteAllMeals() {
        for i in 0..._meals.count {
            _meals[i].deleteAll()
        }
        proteinPer = 0
        carbohdratesPer = 0
        vegetablesPer = 0
    }
    
    // MARK: - AUXILIAR
    
    private func foodCount() -> [Int] {
        var count = [0,0,0]
        for meal in _meals {
            let temp = meal.counter()
            count[0] += temp[0]
            count[1] += temp[1]
            count[2] += temp[2]
        }
        return count
    }
    
    private func updatePercentages() {
        let typesCount = foodCount()
        let totalCount = typesCount[0] + typesCount[1] + typesCount[2]
        if totalCount > 0 {
            proteinPer      = (typesCount[FoodType.protein.rawValue]        * 100) / totalCount
            carbohdratesPer = (typesCount[FoodType.carbohydrates.rawValue]  * 100) / totalCount
            vegetablesPer   = (typesCount[FoodType.vegetables.rawValue]     * 100) / totalCount
        }
    }
    
    
}
