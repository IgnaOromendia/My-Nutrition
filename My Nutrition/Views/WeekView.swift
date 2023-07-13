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
                // TODO: PROBLEM when there is a delete in a meal in the mealview, the percentages do not refresh
                List(current_week) { day in
                    WeekCell(day: day, color: .clear) // TODO: CHANGE COLOR
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .refreshable {
                    for day in current_week {
                        day.updatePercentages()
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(current_week[0].date().dayMonthDate + " - " + current_week[6].date().dayMonthDate)
            .toolbar {
                Button {
                    // Go to PDF manager
                    print("PDF Manager")
                } label: {
                    //Text("Export")
                    Image(systemName: shareImage)
                }
                .padding(20)
                .tint(.white)
            }
        }
    }
    
}

struct WeekView_Preview: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
