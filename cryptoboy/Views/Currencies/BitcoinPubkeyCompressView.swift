//
//  BitcoinPubkeyCompressView.swift
//  cryptoboy
//
//  Created by Pavel on 03/05/2021.
//

import Foundation
import SwiftUI
import WalletCore

struct BitcoinPubkeyCompressView: View {
    @EnvironmentObject var state: AppState
    @State private var publicKey: PublicKey? = nil
    @State private var isValid: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Public Key")) {
                HStack {
                    TextField("", text: Binding(
                        get: {
                            return publicKey?.description ?? ""
                        },
                        set: { (newValue) in
                            // Validate
                            guard let data = Data(fromHexEncodedString: newValue) else {
                                isValid = false
                                return
                            }
                            
                            var pubkey: PublicKey? = nil
                            pubkey = PublicKey.init(data: data, type: .secp256k1)
                            if (pubkey == nil) {
                                pubkey = PublicKey.init(data: data, type: .secp256k1Extended)
                            }
                            
                            if (pubkey == nil) {
                                isValid = false
                                return
                            }

                            // Update
                            isValid = true
                            publicKey = pubkey
                        })
                    )
                    .modifier(SimpleKeyboardViewModifier())
                    
                    ClearButtonView({ publicKey = nil }, { publicKey == nil })
                }
                
                Button(action: {
                    let privateKey = PrivateKey.init()
                    publicKey = privateKey.getPublicKeySecp256k1(compressed: randomBool())
                    isValid = true
                }) {
                    Text("Generate New")
                }
            }
            
            if (publicKey != nil && isValid) {
                CopyAlertTextView("Public Key Type", { return isCompressed() })
                CopyAlertTextView("Compressed", { return publicKey!.compressed.description })
                CopyAlertTextView("Uncompressed", { return publicKey!.uncompressed.description })
            }
        }
        .modifier(NavigationViewModifier(page: .btc_pubkey))
        .environmentObject(state)
    }
    
    func isCompressed() -> String {
        if publicKey!.isCompressed {
            return "Compressed"
        }
        
        return "Uncompressed"
    }
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
