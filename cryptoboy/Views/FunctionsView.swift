//
//  FunctionsView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct FunctionsView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        List {
            ForEach(state.functionsMenu, id: \.id) { section in
                Section(header: Text(section.title)) {
                    ForEach(section.items, id: \.id) { item in
                        NavigationRow(item: item)
                    }
                }
            }
        }
        //.listStyle(GroupedListStyle())
        .navigationTitle("Functions")
        //.navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}

struct FunctionsView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionsView()
            .environmentObject(AppState())
    }
}
