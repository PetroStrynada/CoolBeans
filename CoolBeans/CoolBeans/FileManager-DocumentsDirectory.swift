//
//  FileManager-DocumentsDirectory.swift
//  CoolBeans
//
//  Created by Petro Strynada on 24.03.2023.
//

import Foundation

//for saving history or orders, configured drinks

extension FileManager {
    //path for place where we can save data from "Serving" history
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
