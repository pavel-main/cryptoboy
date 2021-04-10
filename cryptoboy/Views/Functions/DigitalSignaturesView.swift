//
//  DigitalSignaturesView.swift
//  cryptoboy
//
//  Created by Pavel on 07/04/2021.
//

import SwiftUI
import WalletCore

struct DigitalSignaturesView: View {
    @EnvironmentObject var state: AppState

    let digestTypes: [HashFunction] = [
        .sha256,
        .sha512,
        .keccak256,
        .keccak512,
        .blake256,
        .groestl512
    ]

    var body: some View {
        Form {
            Section(header: Text("Private Key")) {
                HStack {
                    Image(systemName: "terminal")

                    TextField("", text: Binding(
                        get: {
                            guard let privateKey = self.state.privateKey else {
                                return ""
                            }

                            return privateKey.data.hexString
                        },
                        set: { (newValue) in
                            // Validate
                            guard let input = Data.init(hexString: newValue) else {
                                return
                            }

                            // Update
                            if let privateKey = PrivateKey.init(data: input) {
                                self.state.privateKey = privateKey
                            }
                        })
                    )

                    Button(action: state.clearPrivateKey) {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .disabled(state.privateKey == nil)
                }

                Button(action: {
                    self.state.privateKey = PrivateKey.init()
                }) {
                    Text("Generate New")
                }
            }

            Section(header: Text("Digest")) {
                Picker(selection: $state.digestType, label: Text("Digest")) {
                    ForEach(digestTypes, id: \.self) { idx in
                        Text(idx.title).tag(idx)
                    }
                }
            }

            Section(header: Text("Message")) {
                HStack {
                    Image(systemName: "text.bubble")

                    TextField("", text: $state.message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Button(action: {
                        state.clearMessage()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .disabled(state.message.isEmpty)
                }
            }

            if state.privateKey != nil && !state.message.isEmpty {
                DigitalSignatureItemView(.raw)
                DigitalSignatureItemView(.asn1)
                DigitalSignatureItemView(.schnorr)
            }
        }
        .modifier(NavigationViewModifier(page: .ecdsa))
    }
}
