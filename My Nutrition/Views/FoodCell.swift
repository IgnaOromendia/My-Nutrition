//
//  FoodCell.swift
//  My Nutrition
//
//  Created by Igna on 03/07/2023.
//

import SwiftUI

struct FoodCell: View {
    var name: String
    var amount: Int
    var type: FoodType
    
    var body: some View {
        HStack {
            let text = amount > 1 ? "\(amount) x " + name : name
            Text(text)
                .font(.system(size: 19))
                .bold()
                .foregroundColor(colorFoodType(type).0)
        }
    }
}
