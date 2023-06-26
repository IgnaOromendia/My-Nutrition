//
//  Food.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation
import SwiftUI

class Food: CustomStringConvertible, Equatable, Comparable, Codable {
    
    // Variables
    private var _name: String
    private var _type: FoodType
    
    var description: String {
        return self._name
    }
    
    init(name: String, type: FoodType) {
        self._name = name
        self._type = type
    }
    
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs._name == rhs._name && lhs._type == rhs._type
    }
    
    /// Lexicographical comparison
    static func < (lhs: Food, rhs: Food) -> Bool {
        return lhs._name < rhs._name
    }
    
    // MARK: - GETs
    
    func name() -> String {
        return _name
    }
    
    func type() -> FoodType {
        return _type
    }
    
    /// Returns the color depending on the food type
    private func associatedColorType() -> Color {
        switch _type {
        case .none:
            return .accentColor
        case .protein:
            return .orange
        case .carboohydrates:
            return .yellow
        case .vegetables:
            return .green
        }
    }
    
    
    
    
}
