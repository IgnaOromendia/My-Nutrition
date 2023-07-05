//
//  FoodCell.swift
//  My Nutrition
//
//  Created by Igna on 03/07/2023.
//

import SwiftUI

struct FoodCell: View {
    let food: Food
    
    init(name: String, amount: Int, type: FoodType) {
        self.food = Food(name: name, type: type, amount: amount)
    }
    
    init(of food: Food) {
        self.food = food
    }
    
    var body: some View {
        HStack {
            let text = food.amount() > 1 ? "\(food.amount()) x " + food.name() : food.name()
            Text(text)
                .font(.system(size: 19))
                .bold()
                .foregroundColor(food.associatedColorType())
        }
    }
}
