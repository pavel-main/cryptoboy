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

                    ClearButtonView({ self.state.clearPrivateKey() }, { self.state.privateKey == nil })
                }

                Button(action: {
                    self.state.privateKey = PrivateKey.init()
                }) {
                    Text("Generate New")
                }
            }

            Section(header: Text("Public Key (secp256k1)")) {
                HStack {
                    Image(systemName: "terminal")

                    TextField("", text: Binding(
                        get: {
                            guard let privateKey = self.counterKey else {
                                return ""
                            }

                            return self.curveType.getPublicKey(from: privateKey).data.hexString
                        },
                        set: { (newValue) in
                            // Validate
                            guard let input = Data.init(hexString: newValue) else {
                                return
                            }

                            // Update
                            if let counterKey = PrivateKey.init(data: input) {
                                self.counterKey = counterKey
                            }
                        })
                    )

                    ClearButtonView({ self.counterKey = nil }, { self.counterKey == nil })
                }

                Button(action: {
                    self.counterKey = PrivateKey.init()
                }) {
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
        guard let privateKey = self.state.privateKey else {
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
