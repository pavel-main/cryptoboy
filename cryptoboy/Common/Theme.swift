//
//  Theme.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct Theme: Hashable {
    var colorPrimary: Color = Color.primary
    var name: String = "system"
    var publicName: String = "System"
}

var themes: [Theme] = [
    Theme(colorPrimary: Color.blue, name: "blue", publicName: "Blue"),
    Theme(colorPrimary: Color.orange, name: "orange", publicName: "Orange"),
    Theme(colorPrimary: Color.purple, name: "purple", publicName: "Purple"),
    Theme(colorPrimary: Color.red, name: "red", publicName: "Red"),
    Theme(colorPrimary: Color.green, name: "green", publicName: "Green"),
    Theme(colorPrimary: Color.pink, name: "pink", publicName: "Pink"),
    Theme(colorPrimary: Color.yellow, name: "yellow", publicName: "Yellow"),
    Theme(colorPrimary: Color.primary, name: "system", publicName: "System"),
]

func getTheme(themeName: String?) -> Theme {
    if themeName != nil {
        for theme in themes {
            if themeName! == theme.name {
                return theme
            }
        }
    }
    
    return themes[0]
}
