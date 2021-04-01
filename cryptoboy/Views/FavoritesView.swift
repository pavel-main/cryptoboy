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
        if !state.bookmarks.isEmpty {
            List {
                ForEach(state.bookmarks, id: \.self) { view in
                    NavigationRow(item: state.getMenuItem(view)!)
                }
                .onDelete(perform: deleteBookmark)
            }
            //.listStyle(GroupedListStyle())
            .navigationTitle("Favorites")
            //.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(state)
        } else {
            Text("Favorites list is empty")
            .padding()
            .navigationTitle("Favorites")
            //.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(state)
        }
    }

    func deleteBookmark(at offsets: IndexSet) {
        state.bookmarks.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(AppState())
    }
}
