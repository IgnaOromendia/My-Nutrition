//
//  WeekView.swift
//  My Nutrition
//
//  Created by Igna on 06/07/2023.
//

import Foundation
import SwiftUI

struct WeekView: View {
    
    var body: some View {
        VStack {
            NavigationView {
                List(current_week) { day in
                    Text(day.date().prettyDate)
                }
            }.navigationTitle(current_week[0].date().dayMonthDate + " - " + current_week[6].date().dayMonthDate)
        }
    }
    
}
