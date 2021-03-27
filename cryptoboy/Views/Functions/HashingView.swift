//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashingView: View {
    @State private var input = ""
    
    @State private var sha256 = ""
    @State private var keccak256 = ""
    @State private var ripemd160 = ""
    
    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "text.bubble")
                    TextEditor(text: $input)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: input) { newValue in
                            encode()
                        }
                    Button(action: clear) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            
            Section(header: Text("sha256")) {
                HStack {
                    Image(systemName: "number")
                    TextField("Secure Hash Algorithm 2", text: $sha256)
                    Button(action: {
                        UIPasteboard.general.string = sha256
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                }
            }
            
            Section(header: Text("keccak256")) {
                HStack {
                    Image(systemName: "number")
                    TextField("Secure Hash Algorithm 3", text: $keccak256)
                    Button(action: {
                        UIPasteboard.general.string = keccak256
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                }
            }
            
            Section(header: Text("ripemd160")) {
                HStack {
                    Image(systemName: "number")
                    TextField("RIPE Message Digest", text: $ripemd160)
                    Button(action: {
                        UIPasteboard.general.string = ripemd160
                    }) {
                        Image(systemName: "doc.on.doc")
                    }
                }
            }
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
    
    func clear() {
        input = ""
        sha256 = ""
        keccak256 = ""
        ripemd160 = ""
    }
    
    func encode() {
        sha256 = input.sha256()
        keccak256 = input.keccak256()
        ripemd160 = input.ripemd160()
    }
}
