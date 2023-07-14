//
//  WeekView.swift
//  My Nutrition
//
//  Created by Igna on 06/07/2023.
//

import Foundation
import SwiftUI

struct WeekView: View {
    
    @State private var isCurrentWeek = true
    @State private var showCalendar  = false
    @State private var selectedDay   = Date.now
    @State private var selectedWeek  = current_week
    @State private var title         = makeTitle(with: current_week)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .indigo], startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            NavigationStack {
                // TODO: PROBLEM when there is a delete in a meal in the mealview, the percentages do not refresh
                List(selectedWeek) { day in
                    WeekCell(day: day, color: .clear, editable: isCurrentWeek) // TODO: CHANGE COLOR
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .refreshable {
                    for day in selectedWeek {
                        day.updatePercentages()
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(title)
            .toolbar {
                // Calendar Button
                Button {
                    showCalendar = true
                } label: {
                    Image(systemName: calendarImage)
                }
                .tint(.white)
                .popover(isPresented: $showCalendar) {
                    VStack {
                        DatePicker("Select a day", selection: $selectedDay, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding(.vertical, 115)
                        Spacer()
                        Button("Select Date") {
                            let monday = selectedDay.weekMonday
                            if let newWeek = weeks[monday.storageDate] {
                                selectedWeek = newWeek
                                title = makeTitle(with: newWeek)
                                showCalendar = false
                            } else {
                                // TODO: MAKE AN ALERT
                                print("The selected week is not storaged")
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .padding(10)
                    }
                }
                
                // Share button
                Button {
                    print("PDF manager")
                } label: {
                    Image(systemName: shareImage)
                }
                .tint(.white)
            }
        }
    }
    
}

fileprivate func makeTitle(with week:Week) -> String {
    return week[0].date().dayMonthDate + " - " + week[6].date().dayMonthDate
}
