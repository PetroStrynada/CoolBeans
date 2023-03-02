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
    
    @State private var size = 0
    @State private var isDecaf = false
    
    let sizeOptions = ["Small", "Medium", "Large"]
    
    //to calculate how much caffeine in coffee
    var caffeine: Int {
        100
    }
    
    var calories: Int {
        100
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
                
                Toggle("Decaffeinated", isOn: $isDecaf)
            }
            Section("Estimates") {
                //** makes the text a little bit bolder
                Text("**Caffeine:** \(caffeine) mg")
                Text("**Calories:** \(calories)")
            }
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
    }
}
