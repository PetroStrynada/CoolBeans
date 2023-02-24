//
//  MenuView.swift
//  CoolBeans
//
//  Created by Petro Strynada on 24.02.2023.
//

import SwiftUI

struct MenuView: View {
    //@ObservableObject used if someone (class) passed to your view data, and that class owns that data, not your view
    @EnvironmentObject var menu: Menu
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
