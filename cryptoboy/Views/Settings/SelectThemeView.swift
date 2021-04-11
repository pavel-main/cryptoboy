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
        List {
            Picker(selection: $state.isFemale, label: Text("Gender")) {
                Text("Male").tag(false)
                Text("Female").tag(true)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            ForEach(themes, id: \.self) { theme in
                if (shouldDisplay(theme)) {
                    SelectThemeButton(colorName: theme.publicName, themeName: theme.name)
                }
            }
        }
        .navigationBarTitle("Select Theme")
        .environmentObject(state)
    }
    
    func shouldDisplay(_ theme: Theme) -> Bool {
        guard let female = theme.female else {
            return true
        }
        
        if (self.state.isFemale == female) {
            return true
        }
        
        return false
    }
}
