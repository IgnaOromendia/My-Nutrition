//
//  MealsView.swift
//  My Nutrition
//
//  Created by Igna on 04/07/2023.
//

import Foundation
import SwiftUI

struct MealsVew: View {
        
    private var displayDay: Day
    
    init(day: Day) {
        displayDay = day
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange, .red], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                List(displayDay.allMeals()) { (meal) in
                    Section {
                        ForEach(meal.foods()) { food in
                            FoodCell(of: food)
                        }
                    } header: {
                        Text(meal.momentString())
                            .font(.system(size: 25))
                            .bold()
                            .foregroundColor(.black)
                    }
                }
               .scrollContentBackground(.hidden)
            }
            .navigationTitle(displayDay.date().prettyDate + "'s meals")
        }
    }
}

struct MealsView_Preview: PreviewProvider {
    static var previews: some View {
        MealsVew(day: current_week[today.weekDay])
    }
}
