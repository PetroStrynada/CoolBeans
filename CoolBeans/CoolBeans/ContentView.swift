//
//  ContentView.swift
//  CoolBeans
//
//  Created by Petro Strynada on 20.02.2023.
//

import SwiftUI



struct ContentView: View {
    //var menu will be created and managed by the view and will stay alive. Your view owns that data
    @StateObject var menu = Menu()
    @StateObject var history = History()
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
