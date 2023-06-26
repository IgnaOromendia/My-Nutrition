//
//  Meal.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation

class Meal: Equatable, Codable {
    
    // Variables
    private var _foods  : [Food] = []
    private var _counter: [Int]  = [0,0,0]
    
    
    // Equtable
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs._foods == rhs._foods
    }
    
    // MARK: - GETs
    
    /// Returns an array of foods
    func foods() -> [Food] {
        return _foods
    }
    
    /// Returns true if contains food
    func has_food() -> Bool {
        return _foods.isEmpty
    }
    
    /// Returns the mos udes food type
    func most_used_type() -> FoodType {
        var max_food = max(_counter[0], _counter[1], _counter[2], 0)
        if max_food == _counter[0] {return .protein}
        if max_food == _counter[1] {return .carboohydrates}
        return .vegetables
    }
    
    // MARK: - SETs
    
    // Add a single food
    func addFood(_ food: Food) {
        _foods.append(food)
        _counter[food.type().rawValue] += 1
    }
    
    // MARK: - DELETES
    
    /// Delete food
    func delete_food(_ food: Food) {
        for (i,_food) in _foods.enumerated() {
            if _food == food {
                _counter[_food.type().rawValue] -= 1
                _foods.remove(at: i)
            }
        }
    }
    
    /// Delete food at index
    func delete_food_at(_ i: Int) {
        var j = _foods[i].type().rawValue
        _counter[j] -= 1
        _foods.remove(at: i)
    }
    
    /// Delete last
    func delete_last() {
        var i = _foods.removeLast().type().rawValue
        _counter[i] -= 1
    }
    
    /// Delete first
    func delete_first() {
        var i = _foods.removeFirst().type().rawValue
        _counter[i] -= 1
    }
    
    /// Delete all foods and reset counter
    func delete_all() {
        _counter = [0,0,0]
        _foods.removeAll()
    }
    
    
    
}
