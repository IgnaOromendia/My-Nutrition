//
//  Predictor.swift
//  My Nutrition
//
//  Created by Igna on 27/06/2023.
//

import Foundation

// *** Data structures ***
// - Dictionary to save the amount of all the foods and use it in O(1)
// - Array of array to save the foods
//    - Int the first array the index represents the amount
//    - The second array are the foods that have been used that amount of times

class Predictor: Codable {
    
    // Variables
    private var dicc_food: [Food:Int]
    private var amounts: [[Food]]
    
    init() {
        dicc_food = [:]
        amounts = []
    }
    
    /// Returns the 2 most used
    func most_used() -> (Food, Food) {
        var res = (Food(),Food())
        let last_index = amounts.count-1
        
        if amounts.count == 0 {return res}
        
        res.0 = amounts[last_index][0]
        if amounts[last_index].count > 1 {
            res.1 = amounts[last_index][1]
        } else if amounts.count > 1 {
            for i in 1...last_index {
                if amounts[last_index-i].count > 0 {
                    res.1 = amounts[last_index-i][0]
                    break
                }
            }
        }
        
        return res
    }
    
    /// Updates with new value
    func update_value(_ food: Food) {
        // If the food already exists we need to update the value
        if let old_amount = dicc_food[food] {
            let new_amount = old_amount + 1
            
            // Update the dicctionary with the new value
            dicc_food.updateValue(new_amount, forKey: food)
            
            // Update the array
            for (i,item) in amounts[old_amount-1].enumerated() {
                if item == food {
                    if old_amount == amounts.count {
                        amounts.append([food])
                    } else {
                        amounts[new_amount-1].append(food)
                    }
                    amounts[old_amount-1].remove(at: i)
                    break
                }
            }
        } else {
            // If the food doesn't exists we need to add the value
            dicc_food.updateValue(1, forKey: food)
            if amounts.count == 0 {
                amounts.append([])
            }
            amounts[0].append(food)
        }
    }
    
    
    
}
