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
    
    //just to have easy preview check, adding an example
    static let example = Drink (id: UUID(), name: "Example Drink")
}
