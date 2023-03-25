//
//  MenuView.swift
//  CoolBeans
//
//  Created by Petro Strynada on 24.02.2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""//for search bar, func in MenuSection
    
    //To show coffee options in a grid
    let columns = [
        GridItem(.adaptive(minimum: 150)) //.adaptive means no meter how many columns there. At least 150 points wide of each column
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                //Lazy vertical scrolled grid
                //pinnedViews: .sectionHeaders - now headers are pinned, it will stay fixed
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        //we can add a header for each section
                        Section {
                            //ForEach(section.drinks) { drink in //with out search bar
                            ForEach(section.matches(for: searchText)) { drink in
                                
                                NavigationLink {
                                    CustomizeView(drink: drink) {
                                        dismiss() //when CustomizeView says to dismiss it self, call my dismiss action
                                    }
                                } label: {
                                    VStack {
                                        //In Drink add this code
                                        //So name in .json file and image name in assets are correct
    //                                    var image: String {
    //                                        name.lowercased().replacingOccurrences(of: " ", with: "-")
    //                                    }
                                        Image(drink.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(10)
                                        
                                        Text(drink.name)
                                            .font(.system(.body, design: .serif))
                                    }
                                    .padding(.bottom)
                                }
                                .buttonStyle(.plain)
                            }

                        } header: {
                            Text(section.name)
                                .font(.system(.title, design: .serif))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background) //get the system background color and use on this view
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Drink")
            .searchable(text: $searchText) //add search bar
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
