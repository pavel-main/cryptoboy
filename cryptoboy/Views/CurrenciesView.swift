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
                    Section(header: Text(section.title)) {
                        ForEach(section.items, id: \.id) { item in
                            NavigationRow(item: item)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Currencies")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView()
    }
}
