//
//  CurrenciesView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct CurrenciesView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "currencies.json")
    
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
            .navigationTitle("Currencies")
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}
