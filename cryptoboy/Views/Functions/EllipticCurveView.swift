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

            if state.privateKey != nil {
                Group {
                    EllipticCurveItemView(.secp256k1(compressed: true))
                    EllipticCurveItemView(.ed25519)
                    EllipticCurveItemView(.ed25519blake2b)
                    EllipticCurveItemView(.curve25519)
                    EllipticCurveItemView(.nist256p1)
                }
            }

        }
        .modifier(NavigationViewModifier(page: .ecc))
    }
}
