//
//  HomeView.swift
//  My Nutrition
//
//  Created by Igna on 03/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    private var recommendedMoment: String
    private var moment = Date().moment
    
    init() {
        self.recommendedMoment = passMomentToString(moment)
    }
    
    var body: some View {
        NavigationStack {
            NavigationLink("Add \(recommendedMoment)") {
                AddMealView(moment: moment, foods: current_week[today.weekDay].mealFrom(moment).foods())
            }
            .padding(10)
            // TODO: CHOOSE A WAY OF SELECTING WHICH MOMENT DO THE USER WANT TO ADD THE MEAL
//            NavigationLink("Add Meal") {
//                AddMealView(moment: moment, foods: current_week[today.weekDay].mealFrom(moment).foods())
//            }
            NavigationLink("Today's Meals") {
                MealsVew(day: current_week[today.weekDay], editable: true)
            }
            .padding(10)
            NavigationLink("Week") {
                WeekView()
            }
            .padding(10)
        }
        .tint(.black)
    }
    
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
