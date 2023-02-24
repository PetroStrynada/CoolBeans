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
    
    init() {
        do {
            //look for menu.json file "!" - it mast be there
            let url = Bundle.main.url(forResource: "menu", withExtension: ".json")!
            //load data from that url
            let data = try Data(contentsOf: url)
            //decode data into Menu
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            
            //take that decoded data into sections property
            sections = menuData.sections
        } catch { //if something goes wrong and we don't have menu.json file inside the project
            fatalError("menu.json file is missing or corrupt")
        }
    }
}
