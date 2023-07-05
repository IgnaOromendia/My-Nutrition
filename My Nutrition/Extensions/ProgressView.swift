//
//  ProgressView.swift
//  My Nutrition
//
//  Created by Igna on 05/07/2023.
//

import Foundation
import SwiftUI

struct BarProgressStyle: ProgressViewStyle {
    
    var height  : Double
    var font    : Font
    
    init(height: Double, font: Font) {
        self.height = height
        self.font = font
    }
    
    init(height: Double) {
        self.init(height: height, font: .body)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        let progress = configuration.fractionCompleted ?? 0 // Between 0 and 1
        
        // Container
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                // Title label
                configuration.label
                    .font(font)
                
                // Progress bar
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray))                           // Backgorund
                    .frame(height: height)                              // Frame height
                    .frame(width: geometry.size.width)                  // Frame width
                    .overlay(alignment: .leading) {                     // Progress overlay (progress)
                        RoundedRectangle(cornerRadius: 10)
                            .fill(gradientColor(progress))
                            .frame(width: geometry.size.width * progress)
                            .overlay {                                  // Label of the current progress
                                if let currentValueLabel = configuration.currentValueLabel {
                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    }
            }
        }
    }
}

// Rojo -> Naranja -> Amarillo -> Verde clarito -> Verde
fileprivate func gradientColor(_ progress: Double) -> Color {
    if (progress < 0.2) {return .red}
    if (progress < 0.4) {return .orange}
    if (progress < 0.6) {return .yellow}
    if (progress < 0.8) {return .teal}
    return .green // Progress always less than 1
}
