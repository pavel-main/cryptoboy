//
//  SelectThemeView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeView: View {
    var body: some View {
        List {
            ForEach(themes, id: \.self) { theme in
                SelectThemeButton(colorName: theme.publicName, themeName: theme.name)
            }
        }
        //.navigationBarTitle("Select Theme")
    }
}
