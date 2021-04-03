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
            Text(self.name)
            Spacer()
            Link(destination: URL(string: self.url)!, label: {
                Text(Image(systemName: "link")) + Text(" \(self.title)")
            })
        }

    }
}
