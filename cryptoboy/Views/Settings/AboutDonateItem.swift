//
//  SettingsDonateItem.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct AboutDonateItem: View {
    var type: String
    var address: String

    init(_ type: String, _ address: String) {
        self.type = type
        self.address = address
    }

    var body: some View {
        NavigationLink(destination: QRCodeDisplayView(title: "\(type) address", data: self.address)) {
            HStack {
                Text(self.type)
                Spacer()
                Spacer()
                Button(action: {}) {
                    Text(self.address)
                        .frame(height: 10)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}
