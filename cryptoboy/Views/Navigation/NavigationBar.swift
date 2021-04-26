//
//  NavigationBar.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct NavigationBar: View {
    @EnvironmentObject var state: AppState

    var page: PageType

    init(_ page: PageType) {
        self.page = page
    }

    var body: some View {
        if self.page != .unknown {
            Button(action: {
                guard let result = ClipboardHelper.getString() else {
                    return
                }
                
                self.state.message = result
            }) {
                Image(systemName: "doc.on.clipboard")
            }
//            if !state.hasBookmark("\(page)") {
//                Button(action: {
//                    print("Adding \(page) to bookmarks...")
//                    state.addBookmark("\(page)")
//                }) {
//                    Image(systemName: "star")
//                }
//            } else {
//                Button(action: {
//                    print("Removing \(page) from bookmarks...")
//                    state.removeBookmark("\(page)")
//                }) {
//                    Image(systemName: "star.fill")
//                }
//            }
        }
    }
}
