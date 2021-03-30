//
//  SelectThemeView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeView: View {
    @State var currentThemeName = UserDefaults.standard.string(forKey: "themeName")
    
    var body: some View {
        List {
            ForEach(themes, id: \.self) { theme in
                ChangeThemeButton(currentThemeName: self.$currentThemeName, colorName: theme.publicName, themeName: theme.name)
            }
        }
        .navigationBarTitle("Theme").onAppear {
            self.currentThemeName = UserDefaults.standard.string(forKey: "themeName")
        }
    }
}
