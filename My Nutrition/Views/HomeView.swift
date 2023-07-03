//
//  HomeView.swift
//  My Nutrition
//
//  Created by Igna on 03/07/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddMealView()) {
                    Text("Add Meal")
                }
                NavigationLink(destination: AddMealView()) {
                    Text("Ver comidas")
                }
            }
        }
    }
    
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
