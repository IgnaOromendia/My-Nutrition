//
//  ContentView.swift
//  My Nutrition
//
//  Created by Igna on 26/06/2023.
//

import SwiftUI

struct AddMealView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var moment: DayMoment
    @State var foods: [Food] = []
    
    @State private var name = ""
    @State private var type_b = false
    @State private var type_f = 0
    @State private var amount = ""
    
    init(moment: DayMoment, foods: [Food]) {
        self.moment = moment
        self.foods = foods
    }
    
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
                        .submitLabel(.done)
                    
                    TextField("Amount (1)", text: $amount)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .keyboardType(.decimalPad)
                        .submitLabel(.done)
                    
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
                        .colorMultiply(colorFoodType(FoodType(rawValue: type_f) ?? .none).0)
                        .pickerStyle(.segmented)
                        // TODO: CHANGE TEXT COLOR;
                    }
                    
                    // Button
                    Button("Add Food") {
                        if (!type_b) {type_f = -1}
                        let food = Food(name: name, type: FoodType(rawValue: type_f)!, amount: Int(amount) ?? 1)
                        
                        foods.append(food)                                      // Show in list
                        current_week[today.weekDay].addFood(food, on: moment)   // Add to the object
                        
                        resetTextFields()
                    }
                    .padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    
                    // Table view
                    List {
                        ForEach(foods) { food in
                            FoodCell(of: food)
                                .listRowSeparator(.hidden)
                        }.onDelete { offsets in
                            current_week[today.weekDay].deleteFood(atOffset: offsets, on: moment)
                            foods.remove(atOffsets: offsets)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    // Space
                    Spacer()
                    
                    // Button
                    Button("Finish") {
                        weeks.updateValue(current_week, forKey: current_week.key())
                        StorageManager.saveData(weeks)
                        dismiss()
                    }
                    .padding(10)
                    .buttonStyle(.borderedProminent)
                    .tint(.teal)
                }
            }
        }
    }
    
    private func resetTextFields() {
        name = ""
        amount = ""
        type_b = false
        type_f = 0
    }
    
}

struct AddMealView_Preview: PreviewProvider {
    static var previews: some View {
        AddMealView(moment: .breakfast, foods: [])
    }
}
