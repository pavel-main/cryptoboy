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
                                return
                            }
                            
                            let pubkey = PublicKey.init(data: data, type: .secp256k1) ?? PublicKey.init(data: data, type: .secp256k1Extended)
                            
                            if (pubkey == nil) {
                                return
                            }

                            // Update
                            publicKey = pubkey
                        })
                    )
                    .modifier(SimpleKeyboardViewModifier())
                    
                    ClearButtonView({ publicKey = nil }, { publicKey == nil })
                }

            }
            
            if (publicKey != nil) {
                CopyAlertTextView("Public Key Type", { return isCompressed() })
                
                if (publicKey!.isCompressed) {
                    CopyAlertTextView("Uncompressed", { return publicKey!.uncompressed.description })
                }
                
                if (!publicKey!.isCompressed) {
                    CopyAlertTextView("Compressed", { return publicKey!.compressed.description })
                }
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
}
