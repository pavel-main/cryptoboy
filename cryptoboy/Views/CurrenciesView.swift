//
//  CurrenciesView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct CurrenciesView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        NavigationView {
            List {
                ForEach(state.menu.currencies, id: \.id) { section in
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
        .environmentObject(state)
    }
}
