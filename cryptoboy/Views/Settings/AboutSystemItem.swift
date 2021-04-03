//
//  SettingsSystemItem.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//
import SwiftUI

struct AboutSystemItem: View {
    var name: String
    var value: String

    init(_ name: String, _ value: String) {
        self.name = name
        self.value = value
    }

    var body: some View {
        HStack {
            HStack {
                Text(self.name)
                Spacer()
                Text(self.value)
                    .foregroundColor(.gray)
            }
        }

    }
}

struct SettingsSystemItem_Previews: PreviewProvider {
    static var previews: some View {
        AboutSystemItem("App Version", "1.0")
    }
}
