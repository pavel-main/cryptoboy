//
//  ThemeState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation
import SwiftUI

class ThemeState {
    let themes: [Theme] = [
        Theme(colorPrimary: Color.primary, name: "system", publicName: "System"),
        // Male
        Theme(colorPrimary: Color.red, name: "red", publicName: "Red", female: false),
        Theme(colorPrimary: Color.purple, name: "purple", publicName: "Purple", female: false),
        Theme(colorPrimary: Color.pink, name: "pink", publicName: "Pink", female: false),
        Theme(colorPrimary: Color.orange, name: "orange", publicName: "Orange", female: false),
        Theme(colorPrimary: Color.yellow, name: "yellow", publicName: "Yellow", female: false),
        Theme(colorPrimary: Color.green, name: "green", publicName: "Green", female: false),
        Theme(colorPrimary: Color.blue, name: "blue", publicName: "Blue", female: false),
        // Female Red
        Theme(colorPrimary: Color("scarlet"), name: "scarlet", publicName: "Scarlet", female: true),
        Theme(colorPrimary: Color("dark-red"), name: "dark-red", publicName: "Dark Red", female: true),
        Theme(colorPrimary: Color("wine-red"), name: "wine-red", publicName: "Wine Red", female: true),
        // Female Purple
        Theme(colorPrimary: Color("plum"), name: "plum", publicName: "Plum", female: true),
        Theme(colorPrimary: Color("eggplant"), name: "eggplant", publicName: "Eggplant", female: true),
        Theme(colorPrimary: Color("grape"), name: "grape", publicName: "Grape", female: true),
        Theme(colorPrimary: Color("violet"), name: "violet", publicName: "Violet", female: true),
        Theme(colorPrimary: Color("lavender"), name: "lavender", publicName: "Lavender", female: true),
        // Female Pink
        Theme(colorPrimary: Color("carnation"), name: "carnation", publicName: "Carnation", female: true),
        Theme(colorPrimary: Color("strawberry"), name: "strawberry", publicName: "Strawberry", female: true),
        Theme(colorPrimary: Color("fuchsia"), name: "fuchia", publicName: "Fuchsia", female: true),
        Theme(colorPrimary: Color("salmon"), name: "salmon", publicName: "Salmon", female: true),
        // Female Orange
        Theme(colorPrimary: Color("orange"), name: "orange-female", publicName: "Orange", female: true),
        Theme(colorPrimary: Color("melon"), name: "melon", publicName: "Melon", female: true),
        // Female Yellow
        Theme(colorPrimary: Color("yellow"), name: "yellow-female", publicName: "Yellow", female: true),
        Theme(colorPrimary: Color("lemon"), name: "lemon", publicName: "Lemon", female: true),
        // Female Green
        Theme(colorPrimary: Color("lime"), name: "lime", publicName: "Lime", female: true),
        Theme(colorPrimary: Color("fresh-grass"), name: "fresh-grass", publicName: "Fresh Grass", female: true),
        Theme(colorPrimary: Color("green"), name: "green-female", publicName: "Green", female: true),
        Theme(colorPrimary: Color("dark-green"), name: "dark-green", publicName: "Dark Green", female: true),
        Theme(colorPrimary: Color("moss"), name: "moss", publicName: "Moss", female: true),
        Theme(colorPrimary: Color("green-yellow"), name: "green-yellow", publicName: "Green Yellow", female: true),
        // Female Blue
        Theme(colorPrimary: Color("sea-green"), name: "sea-green", publicName: "Sea Green", female: true),
        Theme(colorPrimary: Color("blue-green"), name: "blue-green", publicName: "Blue Green", female: true),
        Theme(colorPrimary: Color("sky-blue"), name: "sky-blue", publicName: "Sky Blue", female: true),
        Theme(colorPrimary: Color("turquoise"), name: "turquoise", publicName: "Turquoise", female: true)
    ]

    func get(_ themeName: String?) -> Theme {
        if themeName != nil {
            for theme in themes {
                if themeName! == theme.name {
                    return theme
                }
            }
        }

        return themes[0]
    }
}
