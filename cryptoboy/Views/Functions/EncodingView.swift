//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct EncodingView: View {
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
            
            EncodingItemView(.hex, "Hexadecimal")
            EncodingItemView(.base58, "Base58")
            EncodingItemView(.base64, "Base64")
            EncodingItemView(.rot13, "ROT13")
            EncodingItemView(.bin, "Binary")
        }
        .navigationTitle("Encoding Formats")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            state.visitView("encoding")
        }
        .toolbar {
            NavigationBar("encoding")
        }
    }
}
