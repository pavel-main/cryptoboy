//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashingView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "terminal")
                    
                    TextEditor(text: $state.message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button(action: state.clearMessage) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            
            HashingItemView(.sha1, "SHA-1")
            HashingItemView(.sha256, "SHA-256")
            HashingItemView(.sha512, "SHA-512")
            HashingItemView(.keccak256, "Keccak256")
            HashingItemView(.keccak512, "Keccak512")
            HashingItemView(.ripemd160, "RIPEMD-160")
            HashingItemView(.blake256, "BLAKE-256")
            HashingItemView(.groestl512, "Grøstl-512")
        }
        .navigationTitle("Hash Functions")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            state.visitView("hash")
        }
        .toolbar {
            NavigationBar("hash")
        }
    }
}
