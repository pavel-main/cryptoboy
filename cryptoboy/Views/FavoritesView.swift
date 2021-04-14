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
            if !state.bookmarks.isEmpty {
                List {
                    ForEach(state.bookmarks, id: \.self) { view in
                        NavigationRow(item: state.getMenuItem(view)!)
                    }
                    .onDelete(perform: state.removeBookmarks)
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Favorites")
            } else {
                VStack {
                    Spacer()

                    Image("bookmarks-empty")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.35)

                    Text("Your starred items will appear here")

                    Spacer()
                    Spacer()
                }
                .navigationTitle("Favorites")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}
