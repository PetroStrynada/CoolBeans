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
    @State private var shovingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                if history.servings.isEmpty {
                    Button("Add your first drink") {
                        shovingAddScreen = true
                    }
                } else {
                    ForEach(history.servings) { serving in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                
                                Text(serving.description)
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Text("\(serving.caffeine)mg")
                        }
                    }
                }
            }
            .sheet(isPresented: $shovingAddScreen, content: MenuView.init)
            .navigationTitle("Cool Beans")
            .toolbar {
                Button {
                    shovingAddScreen = true
                } label: {
                    Label("Add new drink", systemImage: "plus")
                }
            }
        }
        //MenuView()
            .environmentObject(menu)
            .environmentObject(history)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
