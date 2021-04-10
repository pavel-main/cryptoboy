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

    var type: SignatureFormat

    init(_ type: SignatureFormat) {
        self.type = type
    }

    var body: some View {
        if !state.isDefaultMessage(false) {
            CopyAlertTextView(self.type.title, { return getSignedMessage() })
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
