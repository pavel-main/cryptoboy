//
//  NavigationViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

public struct NavigationViewModifier: ViewModifier {

    @EnvironmentObject var state: AppState

    let page: PageType

    public func body(content: Content) -> some View {
        content
            .navigationTitle(page.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    PasteNavigationBar(page)
                }
            }
    }
}
