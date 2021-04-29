//
//  FavoritesView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct ClipboardView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        NavigationView {
            VStack {
                if !state.clipboard.isEmpty {
                    List {
                        ForEach(state.clipboard, id: \.self) { item in
                            ClipboardItemView(item)
                        }
                        .onDelete(perform: state.removeClipboard)
                    }
                    .listStyle(GroupedListStyle())
                } else {
                    Spacer()

                    Image("clipboard-empty")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.35)

                    Text("Copied items will appear here")

                    Spacer()
                    Spacer()
                }
            }
            .navigationTitle("Clipboard")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}
