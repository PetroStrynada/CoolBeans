//
//  Menu.swift
//  CoolBeans
//
//  Created by Petro Strynada on 20.02.2023.
//

import Foundation

//it will a class because we want to inject it to SwiftUI environment, so every view inside our layout can read this class
//ObservableObject - swiftUI knows to watch for changes
//Codable - can load and save from .json
class Menu: ObservableObject, Codable {
    //Menu sections has a bunch of all struct MenuSection with (id: UUID, name: String, drinks: [Drink])
    let sections: [MenuSection]
    
    
}
