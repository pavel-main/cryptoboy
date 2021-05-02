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

    let messagePages: [PageType] = [.hash, .encoding, .ecdsa, .qrcode, .shamir]

    init(_ page: PageType) {
        self.page = page
    }

    var body: some View {
        if messagePages.contains(self.page) && !state.isBinary {
            Button(action: {
                let paste = ClipboardHelper.getString()
                if !paste.isEmpty {
                    state.message.value = paste
                }
            }) {
                Image(systemName: "arrow.down.doc")
            }
            .disabled(ClipboardHelper.isEmpty())
        }
    }
}
