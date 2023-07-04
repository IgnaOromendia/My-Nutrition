//
//  Food.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import Foundation
import SwiftUI

class Food: CustomStringConvertible, Equatable, Comparable, Codable, Hashable, Identifiable {
    
    // Variables
    let id: String
    private var _name: String
    private var _type: FoodType
    private var _amount: Int
    
    // Constructor
    init(name: String, type: FoodType, amount: Int = 1) {
        self.id = UUID().uuidString
        self._name = name
        self._type = type
        self._amount = amount
    }
    
    convenience init() {
        self.init(name: "", type: .none, amount: 0)
    }
    
    // CustomStringConvertible
    var description: String {
        return self._name
    }
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(_name)
        hasher.combine(_type)
    }
    
    // Equtable
    static func == (lhs: Food, rhs: Food) -> Bool {
        return lhs._name == rhs._name && lhs._type == rhs._type
    }
    
    // Comparable
    /// Lexicographical comparison
    static func < (lhs: Food, rhs: Food) -> Bool {
        return lhs._name < rhs._name
    }
    
    // MARK: - GETs
    
    /// Returns the name of the Food
    func name() -> String {
        return _name
    }
    
    /// Returns the type of the Food
    func type() -> FoodType {
        return _type
    }
    
    func amount() -> Int {
        return _amount
    }
    
    /// Returns the color depending on the food type
    func associated_color_type() -> Color {
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
