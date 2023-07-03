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

struct AddMealView: View {
    
    @State var moment: DayMoment = .breakfast
    @State private var foods: [Food] = [Food(name: "Carne", type: .protein), Food(name: "Ensalada de lechuga", type: .vegetables)]
    @State private var name = ""
    @State private var type_b = false
    @State private var type_f = 0
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.white, .green], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
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
                    Button("Add Food") {
                        if (!type_b) {type_f = -1}
                        foods.append(Food(name: name, type: FoodType(rawValue: type_f)!, amount: Int(amount) ?? 1))
                        name = ""
                        type_b = false
                    }
                    .padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                    // Table view
                    List(foods, id: \.id) { food in
                        FoodCell(name: food.name(), amount: food.amount(), type: food.type())
                            .listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                    
                    // Space
                    Spacer()
                    
                    // Button
//                    NavigationLink(destination: HomeView()) {
//                        let today = 0 // TODO: Func that gets the day
//                        current_week[today].add_meal(Meal(foods: foods), on: moment)
//                        Text("Add Meal")
//                    }
//                    .padding(10)
//                    .buttonStyle(.borderedProminent)
//                    .tint(.teal)
                }
            }
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
        return (.black, .white)
    }
}

struct AddMealView_Preview: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
