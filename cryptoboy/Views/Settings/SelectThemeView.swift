//
//  SelectThemeView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct SelectThemeView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        Group {
            Picker(selection: $state.isFemale, label: Text("Gender")) {
                Text("Male").tag(false)
                Text("Female").tag(true)
            }
            .padding()
            .pickerStyle(SegmentedPickerStyle())

            List {
                ForEach(state.theme.themes, id: \.self) { theme in
                    if shouldDisplay(theme) {
                        SelectThemeButton(theme: theme)
                    }
                }
            }
        }
        .navigationBarTitle("Select Theme")
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }

    func shouldDisplay(_ theme: Theme) -> Bool {
        guard let female = theme.female else {
            return true
        }

        if self.state.isFemale == female {
            return true
        }

        return false
    }
}
