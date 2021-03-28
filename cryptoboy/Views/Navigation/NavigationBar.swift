//
//  NavigationBar.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var state: AppState
    
    var view: String
    
    init(_ view: String) {
        self.view = view
    }
    
    var body: some View {
        if (!state.hasBookmark(view)) {
            Button(action: {
                print("Adding \(view) to bookmarks...")
                state.addBookmark(view)
            }) {
                Image(systemName: "star")
            }
        } else {
            Button(action: {
                print("Removing \(view) from bookmarks...")
                state.removeBookmark(view)
            }) {
                Image(systemName: "star.fill")
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar("hash")
    }
}
