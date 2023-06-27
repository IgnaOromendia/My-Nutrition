//
//  Predictor.swift
//  My Nutrition
//
//  Created by Igna on 27/06/2023.
//

import Foundation

class Predictor: Codable {
    
    // Variables
    private var dicc_food: [Food:Int]
    private var apperances: [[Food]]
    
    init() {
        dicc_food = [:]
        apperances = [[]]
    }
    
    /// Returns the 2 most used
    func most_used() -> (Food, Food)? {
        var res = (Food(),Food())
        var lastIndex = apperances.count-1
        
        if apperances.isEmpty {return nil}
        
        if apperances[lastIndex].count > 1 {
            res.0 = apperances[lastIndex][0]
            res.1 = apperances[lastIndex][1]
        } else {
            res.0 = apperances[lastIndex][0]
            for i in (apperances.count-2)...0 {
                if !apperances[i].isEmpty {
                    res.1 = apperances[i][0]
                    break
                }
            }
        }
        
        return res
    }
    
    
    
}
