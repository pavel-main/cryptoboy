//
//  ChangeThemeButton.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeButton: View {
    @EnvironmentObject var state: AppState
    @AppStorage("currentTheme") var currentTheme: String = "green"

    var theme: Theme

    var body: some View {
        HStack {
            Button(action: {
                self.currentTheme = self.theme.name
            }) {
                HStack {
                    Circle()
                        .strokeBorder(state.invertedColor(), lineWidth: 1)
                        .background(Circle().foregroundColor(state.theme.get(theme.name).colorPrimary))
                        .frame(width: 25, height: 25)

                    Text(self.theme.publicName)

                    if self.isActive() {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .environmentObject(state)
    }

    func isActive() -> Bool {
        let current = state.theme.get(currentTheme)

        if current.name == theme.name && current.female == theme.female {
            return true
        }

        return false
    }
}
