//
//  Serving.swift
//  CoolBeans
//
//  Created by Petro Strynada on 24.03.2023.
//

import Foundation

//For counting all final parameters of all order
struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
