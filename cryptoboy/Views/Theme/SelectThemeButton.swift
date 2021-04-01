//
//  ChangeThemeButton.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeButton: View {
    @EnvironmentObject var state: AppState
    @AppStorage("currentTheme") var currentTheme: String = "blue"
    var colorName: String
    var themeName: String

    var body: some View {
        HStack {
            Button(action: {
                self.currentTheme = self.themeName
            }) {
                HStack {
                    Circle()
                        .strokeBorder(state.invertedColor(), lineWidth: 1)
                        .background(Circle().foregroundColor(getTheme(themeName: self.themeName).colorPrimary))
                        .frame(width: 25, height: 25)

                    Text(self.colorName)

                    if self.currentTheme == self.themeName {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .environmentObject(state)
    }
}
