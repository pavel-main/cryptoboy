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
        NavigationView {
            if (!state.bookmarks.isEmpty) {
                Text("Favorites list is NOT empty")
                    .padding()
                    .navigationTitle("Favorites")
            } else {
                Text("Favorites list is empty")
                    .padding()
                    .navigationTitle("Favorites")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(AppState())
    }
}
