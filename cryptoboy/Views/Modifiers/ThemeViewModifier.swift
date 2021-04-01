//
//  ThemeViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

public struct ThemeViewModifier: ViewModifier {

    @AppStorage("currentTheme") var currentTheme: String = "blue"

    public func body(content: Content) -> some View {
        content
            .accentColor(getTheme(themeName: currentTheme).colorPrimary)
    }
}
