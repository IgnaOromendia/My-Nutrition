//
//  GoalsView.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

import Foundation
import SwiftUI

struct GoalsView: View {
    
    init() {
        goals = [Goal(progress: 10,title: "Goal A"),
                 Goal(progress: 30, title: "Goal B"),
                 Goal(progress: 50, title: "Goal C"),
                 Goal(progress: 70, title: "Goal D"),
                 Goal(progress: 90, title: "Goal E")]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                
                List(goals) { goal in
                    GoalCell(goal: goal)
                }
                .scrollContentBackground(.hidden)
                
            }
        }
    }
    
}


struct GoalsView_Preview: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
