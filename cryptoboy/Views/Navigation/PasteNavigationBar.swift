//
//  NavigationBar.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI
import WalletCore

struct PasteNavigationBar: View {
    @EnvironmentObject var state: AppState

    var page: PageType

    let messagePages: [PageType] = [.hash, .encoding, .ecdsa]
    let keyPages: [PageType] = [.keypair, .ecdh]

    init(_ page: PageType) {
        self.page = page
    }

    var body: some View {
        if messagePages.contains(self.page) {
            Button(action: {
                guard let result = ClipboardHelper.getString() else {
                    return
                }

                self.state.message = result
            }) {
                Image(systemName: "square.and.arrow.down.on.square")
            }
        }

        if keyPages.contains(self.page) {
            Button(action: {
                guard let result = ClipboardHelper.getString() else {
                    return
                }

                guard let input = Data.init(hexString: result) else {
                    return
                }

                guard let privateKey = PrivateKey.init(data: input) else {
                    return
                }

                self.state.privateKey = privateKey
            }) {
                Image(systemName: "square.and.arrow.down.on.square")
            }
        }
    }
}
