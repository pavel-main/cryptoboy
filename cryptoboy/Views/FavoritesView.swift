//
//  FavoritesView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        if (!state.bookmarks.isEmpty) {
            NavigationView {
                List {
                    ForEach(state.bookmarks.reversed(), id: \.self) { view in
                        NavigationRow(item: state.getMenuItem(view)!)
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Favorites")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(state)
        } else {
            NavigationView {
                Text("Favorites list is empty")
                    .padding()
                    .navigationTitle("Favorites")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(state)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(AppState())
    }
}
