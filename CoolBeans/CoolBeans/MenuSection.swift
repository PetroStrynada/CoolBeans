//
//  MenuSection.swift
//  CoolBeans
//
//  Created by Petro Strynada on 20.02.2023.
//

import Foundation

//Codable - can load and save from .json
struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    //We have many drinks inside each menu section
    //So it well be array of drinks
    //struct Drink with (id: UUID, name: String) will help me with it
    let drinks: [Drink]
}
