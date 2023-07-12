//
//  WeekCell.swift
//  My Nutrition
//
//  Created by Igna on 07/07/2023.
//

import Foundation
import SwiftUI

fileprivate let circleFrame: CGFloat = 23

struct WeekCell: View {
    let title: String
    let color: UIColor
    let proteinPrecentage: Int
    let carbohydratesPrecentage: Int
    let vegetablesPrecentage: Int
    let day: Day
    
    init(day: Day, color: UIColor) {
        self.day                     = day
        self.title                   = day.date().prettyDate
        self.color                   = color
        self.proteinPrecentage       = day.foodPercentage(of: .protein)
        self.carbohydratesPrecentage = day.foodPercentage(of: .carbohydrates)
        self.vegetablesPrecentage    = day.foodPercentage(of: .vegetables)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(20)
            VStack {
                NavigationLink(title) {
                    MealsVew(day: day)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .font(.system(size: 20))
                .bold()
                HStack {
                    Spacer()
                    Circle()
                        .fill(.orange)
                        .frame(width: circleFrame, height: circleFrame)
                    Text("\(proteinPrecentage)%")
                    Spacer()
                    Circle()
                        .fill(.yellow)
                        .frame(width: circleFrame, height: circleFrame)
                    Text("\(carbohydratesPrecentage)%")
                    Spacer()
                    Circle()
                        .fill(.green)
                        .frame(width: circleFrame, height: circleFrame)
                    Text("\(vegetablesPrecentage)%")
                    Spacer()
                }
                .padding(10)
            }
        }
        .padding(5)
    }
    
}
