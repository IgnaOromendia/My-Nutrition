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
        ZStack {
            LinearGradient(colors: [.green, .indigo], startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            NavigationStack {
                List(current_week) { day in
                    WeekCell(title: day.date().prettyDate, color: .magenta)
                        .listRowSeparator(.hidden)
                }// TODO: Sacar el background
                .scrollContentBackground(.hidden)
            }.navigationTitle(current_week[0].date().dayMonthDate + " - " + current_week[6].date().dayMonthDate)
        }
    }
    
}
