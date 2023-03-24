//
//  Drink.swift
//  CoolBeans
//
//  Created by Petro Strynada on 20.02.2023.
//

import Foundation

//Codable - to know how to load and save from .json
//Identifiable - so each is uniq
struct Drink: Codable, Identifiable {
    let id: UUID
    let name: String
    let caffeine: [Int] //we have 3 sizes Small, Medium, Large. So we add array of Ints
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    //replacing of all " " in drinks names with "-"
    //with out it we can't pass Image(drink.image) for showing images in MenuView
    //because in .json name "Flat White" bat in assets name "Flat-White"
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    //just to have easy preview check, adding an example
    static let example = Drink (id: UUID(), name: "Example Drink", caffeine: [60, 90, 200], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}
