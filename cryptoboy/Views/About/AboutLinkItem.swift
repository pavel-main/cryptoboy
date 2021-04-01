//
//  SettingsLinkItem.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct AboutLinkItem: View {
    var name: String
    var url: String
    var title: String

    init(_ name: String, title: String, url: String) {
        self.name = name
        self.url = url
        self.title = title
    }

    var body: some View {
        HStack {
            HStack {
                Text(self.name)
                Spacer()
                Link(self.title, destination: URL(string: self.url)!)
            }
        }

    }
}

struct SettingsLinkItem_Previews: PreviewProvider {
    static var previews: some View {
        AboutLinkItem("E-mail", title: "cryptoboy2283@gmail.com", url: "mailto:cryptoboy2283@gmail.com")
    }
}
