//
//  ThemeViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

public struct ThemeViewModifier: ViewModifier {
    
    @EnvironmentObject var state: AppState
    @AppStorage("currentTheme") var currentTheme: String = DEFAULT_THEME

    public func body(content: Content) -> some View {
        content
            .accentColor(state.getTheme(themeName: currentTheme).colorPrimary)
            .environmentObject(state)
    }
}
