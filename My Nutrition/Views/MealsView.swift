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
    
    init() {
         self.displayDay = current_week[today.weekDay]
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
                    //.listRowSeparator(.hidden)
                }
               .scrollContentBackground(.hidden)
            }
            .navigationTitle(displayDay.date().prettyDate + "'s meals")
        }
    }
}

struct MealsView_Preview: PreviewProvider {
    static var previews: some View {
        MealsVew()
    }
}
