//
//  ContentView.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

/*  Passing Data
    @State more global, used in master view
    @Binfing used in any view where you want to pass the data
    
    Example (Wiki app):
        -- Master view --
        @State private var selectedPage: Page = Page()
 
        NavigationLink(destination: PageView(page: $selectedPage))
 
        The master and detail view point to the same page.
        Any changes you make in the detail view will appear in both views.
        
        -- Detail view --
        @Binding var page: Page
    
    *** ***
    @StateObject property to pass a class instance to other views
    Any properties you want automatically updated must use the @Published property wrapper.
    
    Example (Project):
    class Project: ObservableObject {
        @Published var issues: [Issue]
    }
 
    By making the class conform to ObservableObject and using @Published for the issues array,
    you can use @StateObject in any view that needs to access the project.
 
    @StateObject var project: Project
    
 */

import SwiftUI

struct ContentView: View {
    
    @State private var foods: [Food] = []
    @State private var name = ""
    @State private var type_b = false
    @State private var type_f = 0
    @State private var amount = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .green], startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // Title
                Text("Add your foods")
                    .font(.system(size: 35))
                    .bold()
                    .padding()
                
                // Text fields
                TextField("Name", text: $name)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                
                TextField("Amount (1)", text: $amount)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding()
                
                // Switch
                Toggle("Add Food Type", isOn: $type_b)
                    .toggleStyle(SwitchToggleStyle(tint: .white))
                    .padding()
                
                // Segmented Control
                if type_b {
                    Picker("Add the food type", selection: $type_f) {
                        Text("Protein").tag(0)
                        Text("Carbohydrates").tag(1)
                        Text("Vegetables").tag(2)
                    }
                    .colorMultiply(type_color(type_f).0)
                    .pickerStyle(.segmented)
                    // TODO: CHANGE TEXT COLOR;
                }
                
                // Button
                Button("Add Meal") {
                    foods.append(Food(name: name, type: FoodType(rawValue: type_f)!, amount: Int(amount)!))
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                // Table view
//                List {
//
//                }
                Spacer()
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
