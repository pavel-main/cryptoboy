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

    var body: some View {
        Form {
            Section(header: Text("Input")) {
                HStack {
                    CopyInputButtonView({ return state.message.value }, { return state.message.isDefault() }
                    )

                    TextField("", text: $state.message.value)
                        .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.resetMessage() }, { state.message.isDefault() })
                }
            }
            
            Section(header: Text("Private Key")) {
                HStack {
                    CopyInputButtonView({ return state.keypair.getPrivate() }, { return state.keypair.isEmpty() })

                    TextField("", text: Binding(
                        get: {
                            guard let privateKey = state.keypair.privateKey else {
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
                                state.keypair.privateKey = privateKey
                            }
                        })
                    )
                    .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.keypair = KeypairState() }, { state.keypair.isEmpty() })
                }

                Button(action: { state.keypair.privateKey = PrivateKey.init() }) {
                    Text("Generate New")
                }
            }

            if !state.keypair.isEmpty() && !state.message.isEmpty() {
                DigitalSignatureItemView(.raw)
                DigitalSignatureItemView(.asn1)
                DigitalSignatureItemView(.schnorr)
            }
        }
        .modifier(NavigationViewModifier(page: .ecdsa))
    }
}
