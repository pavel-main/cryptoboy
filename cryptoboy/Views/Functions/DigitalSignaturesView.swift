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
                    CopyInputButtonView({ return self.state.privateKey?.data.hexString ?? "" }, { return self.state.privateKey == nil }
                    )

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
                    .modifier(DefaultKeyboardViewModifier())

                    ClearButtonView({ self.state.clearPrivateKey() }, { self.state.privateKey == nil })
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
                    CopyInputButtonView({ return self.state.message }, { return self.state.isDefaultMessage(false) }
                    )

                    TextField("", text: $state.message)
                        .modifier(DefaultKeyboardViewModifier())

                    ClearButtonView({ self.state.clearMessage() }, { self.state.message.isEmpty })
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
