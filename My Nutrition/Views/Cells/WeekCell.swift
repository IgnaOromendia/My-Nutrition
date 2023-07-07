//
//  WeekCell.swift
//  My Nutrition
//
//  Created by Igna on 07/07/2023.
//

import Foundation
import SwiftUI

struct WeekCell: View {
    var title: String
    var color: UIColor
    
    var body: some View {
        ZStack {
            Color(color)
                .ignoresSafeArea()
            Text(title)
                .padding(10)
                .font(.system(size: 30))
                .bold()
            // TODO: Boton de exportar, Porcentajes de tipos de comida
            // - Para el exportar hacer un share (o algo q diga exportar)
            // - Para los porcentajes estaría bueno una barra dividida en 4 colores
            //   o un circulo con cada color representando el tipo y al lado un porcentaje
        }
    }
    
}

struct WeekCell_Preview: PreviewProvider {
    static var previews: some View {
        WeekCell(title: "07/07", color: UIColor.orange)
    }
}
