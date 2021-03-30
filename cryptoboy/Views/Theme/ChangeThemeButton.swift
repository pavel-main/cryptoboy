//
//  ChangeThemeButton.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct ChangeThemeButton: View {
    @Binding var currentThemeName: String?
    var colorName: String
    var themeName: String?
    
    var body: some View {
        HStack {
            Button(action: {
                UserDefaults.standard.set(self.themeName, forKey: "themeName")
                self.currentThemeName = UserDefaults.standard.string(forKey: "themeName")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "themeUpdated"), object: self)
            }) {
                HStack {
                    Circle()
                    .fill(getTheme(themeName: themeName).colorPrimary)
                    .frame(width: 25, height: 25)
                    
                    Text(self.colorName)
                    
                    if self.currentThemeName == themeName {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
}
