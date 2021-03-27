//
//  FunctionsView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct FunctionsView: View {    
    let menu = Bundle.main.decode([MenuSection].self, from: "functions.json")
    
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
            .navigationTitle("Functions")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionsView()
    }
}
