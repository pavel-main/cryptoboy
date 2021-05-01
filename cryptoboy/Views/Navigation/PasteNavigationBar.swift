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

    let messagePages: [PageType] = [.hash, .encoding, .ecdsa, .qrcode]
    let keyPages: [PageType] = [.keypair, .ecdh, .ecdsa]

    init(_ page: PageType) {
        self.page = page
    }

    var body: some View {
        HStack {
            if keyPages.contains(self.page) {
                Button(action: {
                    let paste = ClipboardHelper.getString()
                    if paste.isEmpty {
                        return
                    }

                    guard let input = Data.init(hexString: paste) else {
                        return
                    }

                    guard let privateKey = PrivateKey.init(data: input) else {
                        return
                    }

                    state.keypair.privateKey = privateKey
                }) {
                    Image(systemName: "lock.doc")
                }
            }

            if messagePages.contains(self.page) {
                Button(action: {
                    let paste = ClipboardHelper.getString()
                    if !paste.isEmpty {
                        state.message.value = paste
                    }
                }) {
                    Image(systemName: "arrow.down.doc")
                }
            }
        }
    }
}
