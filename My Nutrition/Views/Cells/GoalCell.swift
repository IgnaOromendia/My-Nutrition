//
//  GoalCell.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

import Foundation
import SwiftUI

struct GoalCell: View {
    let goal: Goal
    
    var body: some View {
        VStack {
            ProgressView(value: Float(goal.progress()), total: 100) {
                Text(goal.title())
            }
            .progressViewStyle(BarProgressStyle(height: 15))
            .frame(height: 60)
        }
    }
}
