//
//  ChangeThemeButton.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeButton: View {
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
                        .fill(getTheme(themeName: self.themeName).colorPrimary)
                        .frame(width: 25, height: 25)
                    
                    Text(self.colorName)
                    
                    if self.currentTheme == self.themeName {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}
