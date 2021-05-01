//
//  EllipticCurveView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import SwiftUI
import WalletCore

struct EllipticCurveView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        Form {
            Section(header: Text("Private Key")) {
                HStack {
                    CopyInputButtonView({ return state.keypair.getPrivate() }, { return state.keypair.isEmpty() })

                    TextField("", text: Binding(
                        get: {
                            return state.keypair.getPrivate()
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
                    .modifier(DefaultKeyboardViewModifier())

                    ClearButtonView({ state.resetKeypair() }, { state.keypair.isEmpty() })
                }

                Button(action: { state.keypair.privateKey = PrivateKey.init() }) {
                    Text("Generate New")
                }
            }

            if !state.keypair.isEmpty() {
                Group {
                    EllipticCurveItemView(.secp256k1(compressed: true))
                    EllipticCurveItemView(.ed25519)
                    EllipticCurveItemView(.ed25519blake2b)
                    EllipticCurveItemView(.curve25519)
                    EllipticCurveItemView(.nist256p1)
                }
            }

        }
        .modifier(NavigationViewModifier(page: .keypair))
    }
}
