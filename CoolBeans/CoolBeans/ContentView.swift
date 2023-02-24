//
//  ContentView.swift
//  CoolBeans
//
//  Created by Petro Strynada on 20.02.2023.
//

import SwiftUI



struct ContentView: View {
    //var menu will be created and managed by the view and will stay alive. Your view owns that data
    //@ObservableObject used if someone (class) passed to your view data, and that class owns that data, not your view
    @StateObject var menu = Menu()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
