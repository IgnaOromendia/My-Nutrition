//
//  Meal.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation

class Meal: Equatable, CustomStringConvertible, Codable, Identifiable {
    
    // Variables
    let id              : String
    private var _foods  : [Food]
    private var _counter: [Int]
    private var _moment : DayMoment
    
    
    // Equtable
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs._foods == rhs._foods
    }
    
    // Constructor
    init(foods: [Food], moment: DayMoment) {
        self._foods = foods
        self._counter = [0,0,0]
        self._moment = moment
        self.id = UUID().uuidString
    }
    
    convenience init(moment: DayMoment) {
        self.init(foods: [], moment: moment)
    }
    
    var description: String {
        return """
        \(_foods)
        \(_counter)
        \(passMomentToString(_moment))\n
        """
    }
    
    // MARK: - GETs
    
    /// Returns an array of foods
    func foods() -> [Food] {
        return _foods
    }
    
    /// Returns the count of foods
    func foodCount() -> Int {
        return _foods.count
    }
    
    /// Returns true if contains food
    func has_food() -> Bool {
        return _foods.isEmpty
    }
    
    /// Returns the moment of the meal
    func moment() -> DayMoment {
        return _moment
    }
    
    /// Returns the moment of the meal as a String
    func momentString() -> String {
        return passMomentToString(_moment)
    }
    
    /// Returns the most udes food type
    func mostUsedType() -> FoodType {
        let max_food = max(_counter[0], _counter[1], _counter[2], 0)
        if max_food == _counter[0] {return .protein}
        if max_food == _counter[1] {return .carbohydrates}
        return .vegetables
    }
    
    /// Returns the type counter
    func counter() -> [Int] {
        return _counter
    }
    
    // MARK: - SETs
    
    // Add a single food
    func addFood(_ food: Food) {
        _foods.append(food)
        let i = food.type().rawValue
        if i >= 0 { _counter[i] += 1 }
    }
    
    // MARK: - DELETES
    
    /// Delete food
    func deleteFood(_ food: Food) {
        for (i,_food) in _foods.enumerated() {
            if _food == food {
                _counter[_food.type().rawValue] -= 1
                _foods.remove(at: i)
            }
        }
    }
    
    /// Delete food at index
    func deleteFood(at i: Int) {
        let j = _foods[i].type().rawValue
        _counter[j] -= 1
        _foods.remove(at: i)
    }
    
    /// Delete food at offset
    func deleteFood(atOffsets offsets: IndexSet) {
        if let index = offsets.first {
            let i = _foods[index].type().rawValue
            _counter[i] -= 1
        }
        _foods.remove(atOffsets: offsets)
    }
    
    /// Delete last
    func deleteLast() {
        let i = _foods.removeLast().type().rawValue
        _counter[i] -= 1
    }
    
    /// Delete first
    func deleteFirst() {
        let i = _foods.removeFirst().type().rawValue
        _counter[i] -= 1
    }
    
    /// Delete all foods and reset counter
    func deleteAll() {
        _counter = [0,0,0]
        _foods.removeAll()
    }
    
    
    
}
