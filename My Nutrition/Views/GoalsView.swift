//
//  GoalsView.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

import Foundation
import SwiftUI

struct GoalsView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.indigo, .blue], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                
                List(goals) { goal in
                    GoalCell(goal: goal)
                }
                .scrollContentBackground(.hidden)
                .toolbar {
                    NavigationLink(destination: {
                        // Destination view
                    }, label: {
                        Image(systemName: "Add")
                    })
                    .tint(.black)
                }
                    
                
            }
        }
    }
    
}


struct GoalsView_Preview: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
