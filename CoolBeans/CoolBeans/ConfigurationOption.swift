//
//  ConfigurationOption.swift
//  CoolBeans
//
//  Created by Petro Strynada on 02.03.2023.
//

import Foundation

struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "None", calories: 0)
}
