//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashingView: View {
    @EnvironmentObject var state: AppState
    
    @State private var input = ""
    @State private var sha256 = ""
    @State private var keccak256 = ""
    @State private var ripemd160 = ""
    
    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "text.bubble")
                    TextEditor(text: $state.hashMessage)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: state.hashMessage) { newValue in
                            encode()
                        }
                    Button(action: state.clear) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            
            HashingItemView("sha1", "Secure Hash Algorithm 1 (160 bits)")
            HashingItemView("sha256", "Secure Hash Algorithm 2 (256 bits)")
            HashingItemView("sha512", "Secure Hash Algorithm 2 (512 bits)")
            HashingItemView("keccak256", "Keccak (256 bits)")
            HashingItemView("keccak512", "Keccak (512 bits)")
            HashingItemView("ripemd160", "RIPE Message Digest (160 bits)")
            HashingItemView("blake256", "BLAKE (256 bits)")
            HashingItemView("groestl512", "Grøstl (512 bits)")
        }
        .navigationTitle("Hash Functions")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                print("Added to bookmarks...")
            }) {
                Image(systemName: "star")
            }
        }
    }
    
    func encode() {
        self.sha256 = state.hashMessage.sha256()
        self.keccak256 = state.hashMessage.keccak256()
        self.ripemd160 = state.hashMessage.ripemd160()
    }
}
