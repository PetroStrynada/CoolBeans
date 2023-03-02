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
                            ForEach(section.drinks) { drink in
                                
                                NavigationLink {
                                    CustomizeView(drink: drink)
                                } label: {
                                    VStack {
                                        //In Drik add this code
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
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
