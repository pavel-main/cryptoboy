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
                SelectThemeButton(currentThemeName: self.$currentThemeName, colorName: theme.publicName, themeName: theme.name)
            }
        }
        .navigationBarTitle("Select Theme")
        .onAppear {
            self.currentThemeName = UserDefaults.standard.string(forKey: "themeName")
        }
    }
}
