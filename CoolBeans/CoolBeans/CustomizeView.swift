//
//  CustomizeView.swift
//  CoolBeans
//
//  Created by Petro Strynada on 02.03.2023.
//

import SwiftUI



struct CustomizeView: View {
    //for customizing Drink
    let drink: Drink
    
    let dismiss: () -> Void
    
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var history: History
    
    @State private var size = 0 //0 means "Small" at the start
    @State private var isDecaf = false //means the Toggle will be off at the start
    
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    //to calculate how much caffeine in coffee
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += extraShots * 60
        
        if isDecaf {
            caffeineAmount /= 20
        }
        
        return caffeineAmount
    }
    
    var calories: Int {
        var caloriesAmount = drink.baseCalories
        caloriesAmount += extraShots * 10
        
        if drink.coffeeBased {
            caloriesAmount += milk.calories
        } else {
            caloriesAmount += milk.calories / 8
        }
        
        caloriesAmount += syrup.calories
        
        return caloriesAmount * (size + 1)
    }
    
    var body: some View {
        Form {
            Section("Basic options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOptions.indices) { index in
                        Text(sizeOptions[index])
                    }
                }
                .pickerStyle(.segmented)
                
                if drink.coffeeBased {
                    Stepper("Extra shots: \(extraShots)", value: $extraShots, in: 0...10)
                }
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            
            Section("Customizations") {
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option) //gives to each option hash number
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option) //gives to each option hash number
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            
            Section("Estimates") {
                //** makes the text a little bit bolder
                Text("**Caffeine:** \(caffeine) mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationTitle(drink.name)
        .navigationBarTitleDisplayMode(.inline) //making small centered title
        .toolbar {
            Button("Save") {
                history.add(drink, size: sizeOptions[size], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, caffeine: caffeine, calories: calories)
                dismiss()
            }
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example) { }//{ } need to be returned void for dismiss: () -> Void
            .environmentObject(Menu())
    }
}
