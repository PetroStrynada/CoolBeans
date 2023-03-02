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
    //replacing of all "-" in drinks names with " "
    //with out it we can't pass Image(drink.image) for showing images 
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    //just to have easy preview check, adding an example
    static let example = Drink (id: UUID(), name: "Example Drink")
}
