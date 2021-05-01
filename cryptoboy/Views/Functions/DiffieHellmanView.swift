//
//  DiffieHellmanView.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.
//

import SwiftUI
import WalletCore

struct DiffieHellmanView: View {
    @EnvironmentObject var state: AppState
    @State var counterKey: PrivateKey?

    let curveType = EllipticCurvePublicKey.secp256k1(compressed: true)

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
                    .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.keypair = KeypairState() }, { state.keypair.isEmpty() })
                }

                Button(action: { state.keypair.privateKey = PrivateKey.init() }) {
                    Text("Generate New")
                }
            }

            Section(header: Text("Public Key (secp256k1)")) {
                HStack {
                    CopyInputButtonView({ return curveType.getPublicKey(from: counterKey!).data.hexString }, { return counterKey == nil })

                    TextField("", text: Binding(
                        get: {
                            guard let privateKey = counterKey else {
                                return ""
                            }

                            return curveType.getPublicKey(from: privateKey).data.hexString
                        },
                        set: { (newValue) in
                            // Validate
                            guard let input = Data.init(hexString: newValue) else {
                                return
                            }

                            // Update
                            if let ctrKey = PrivateKey.init(data: input) {
                                counterKey = ctrKey
                            }
                        })
                    )
                    .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ counterKey = nil }, { counterKey == nil })
                }

                Button(action: { counterKey = PrivateKey.init() }) {
                    Text("Generate New")
                }
            }

            if !getSharedSecret().isEmpty {
                CopyAlertTextView("Shared Secret", { return getSharedSecret() })
            }
        }
        .modifier(NavigationViewModifier(page: .ecdh))
    }

    func getSharedSecret() -> String {
        guard let privateKey = state.keypair.privateKey else {
            return ""
        }

        guard let counterKey = self.counterKey else {
            return ""
        }

        let publicKey = self.curveType.getPublicKey(from: counterKey)
        guard let sharedKey = privateKey.getSharedKey(publicKey: publicKey, curve: Curve.secp256k1) else {
            return ""
        }

        return sharedKey.hexString
    }
}
