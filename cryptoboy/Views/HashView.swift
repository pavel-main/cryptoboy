//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashView: View {
    @State private var input = ""
    
    @State private var sha256 = ""
    @State private var keccak256 = ""
    @State private var ripemd160 = ""
    
    var body: some View {
        Form {
            Section(header: Text("Input Text")) {
                TextEditor(text: $input)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: input) { newValue in
                        encode()
                    }
            }
            
            Section(header: Text("sha256")) {
                HStack {
                    Image(systemName: "lock")
                    TextField("N/A", text: $sha256)
                }
            }
            
            Section(header: Text("keccak256")) {
                HStack {
                    Image(systemName: "lock")
                    TextField("N/A", text: $keccak256)
                }
            }
            
            Section(header: Text("ripemd160")) {
                HStack {
                    Image(systemName: "lock")
                    TextField("N/A", text: $keccak256)
                }
            }
        }
    }
    
    func encode() {
        sha256 = input.sha256()
        keccak256 = input.keccak256()
        ripemd160 = input.ripemd160()
    }
}
