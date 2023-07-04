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
            NavigationLink("Add \(recommendedMoment) Meal") {
                AddMealView(moment: moment, foods: current_week[today.weekDay].mealFrom(moment).foods())
            }
        }
    }
    
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
