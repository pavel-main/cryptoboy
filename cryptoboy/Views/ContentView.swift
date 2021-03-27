//
//  ContentView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct ContentView: View {    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu, id: \.id) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items, id: \.id) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
