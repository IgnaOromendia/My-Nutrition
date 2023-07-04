//
//  HomeView.swift
//  My Nutrition
//
//  Created by Igna on 03/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink("Add Meal") {
                AddMealView(moment: Date().moment)
            }
            .onAppear {
                print(current_week[0].allMeals())
            }
        }
    }
    
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
