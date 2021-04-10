//
//  DigitalSignatureItemView.swift
//  cryptoboy
//
//  Created by Pavel on 08/04/2021.
//

import SwiftUI
import WalletCore

struct DigitalSignatureItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: SignatureFormat

    init(_ type: SignatureFormat) {
        self.type = type
    }

    var body: some View {
        if !state.isDefaultMessage(false) {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        ClipboardHelper.copyString(getSignedMessage())
                        showCopyAlert.toggle()
                    }) {
                        Text(getSignedMessage())
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(getSignedMessage()),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }

    func getSignedMessage() -> String {
        guard let privateKey = self.state.privateKey else {
            return ""
        }

        guard let message = state.message.data(using: .utf8) else {
            return ""
        }

        let digest = message.hash(state.digestType)

        var signature: Data?

        switch self.type {
            case .raw:
                signature = privateKey.sign(digest: digest, curve: .secp256k1)
            case .asn1:
                signature = privateKey.signAsDER(digest: digest, curve: .secp256k1)
            case .schnorr:
                signature = privateKey.signSchnorr(message: message, curve: .secp256k1)
        }

        guard let result = signature else {
            return ""
        }

        return result.hexString
    }
}
