//
//  MealsView.swift
//  My Nutrition
//
//  Created by Igna on 04/07/2023.
//

import Foundation
import SwiftUI

struct MealsVew: View {
    
    @State private var deletedAnElement :Bool = false
    private var displayDay              :Day
    let editable                        :Bool
    
    init(day: Day, editable: Bool) {
        self.displayDay = day
        self.editable = editable
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
                        .onDelete { offsets in
                            meal.deleteFood(atOffsets: offsets)
                            deletedAnElement = true
                        }
                    } header: {
                        Text(meal.momentString())
                            .font(.system(size: 25))
                            .bold()
                            .foregroundColor(.black)
                    }
                }
                .deleteDisabled(!editable)
                .scrollContentBackground(.hidden)
            }
            .onDisappear {
                if deletedAnElement {
                    current_week[displayDay.date().weekDay].updatePercentages()
                    weeks.updateValue(current_week, forKey: current_week.key())
                    StorageManager.saveData(weeks)
                }
            }
            .navigationTitle(displayDay.date().prettyDate + "'s meals")
        }
    }
}

struct MealsView_Preview: PreviewProvider {
    static var previews: some View {
        MealsVew(day: current_week[today.weekDay], editable: true)
    }
}
