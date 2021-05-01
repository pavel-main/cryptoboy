//
//  ThemeViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

public struct ThemeViewModifier: ViewModifier {

    @EnvironmentObject var state: AppState

    public func body(content: Content) -> some View {
        content
            .accentColor(state.theme.get(state.currentTheme).colorPrimary)
            .environmentObject(state)
    }
}
