//
//  ContentView.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var type_b = false
    @State private var type_f = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .blue], startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Add your foods")
                    .font(.system(size: 35))
                    .bold()
                    .padding()
                TextField("Name", text: $name)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                Toggle("Add Food Type", isOn: $type_b)
                    .padding()
                if type_b {
                    Picker("Add the food type", selection: $type_f) {
                        Text("Protein").tag(0)
                        Text("Carbohydrates").tag(1)
                        Text("Vegetables").tag(2)
                    }
                    .colorMultiply(type_color(type_f).0)
                    .pickerStyle(.segmented)
                    // TODO: CHANGE TEXT COLOR
                    
                }
                Spacer() // Se pude modificar el tamaño
            }
        }
    }
    
    func type_color(_ type: Int) -> (Color,Color){ // Background, TextColor
        switch type {
        case 0:
            return (.orange, .white)
        case 1:
            return (.yellow, .black)
        case 2:
            return (.green, .white)
        default:
            return (.white, .black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
