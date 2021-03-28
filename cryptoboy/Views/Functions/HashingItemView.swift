//
//  HashingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct HashingItemView: View {
    @EnvironmentObject var state: AppState
    @State private var digest = ""
    
    var type: String
    var placeholder: String
    
    init(_ type: String, _ placeholder: String) {
        self.type = type
        self.placeholder = placeholder
    }
    
    var body: some View {
        Section(header: Text(self.type)) {
            HStack {
                Image(systemName: "number")
                TextField(self.placeholder, text: $digest)
                    .disabled(true)
                    .onChange(of: state.hashMessage) { newValue in
                        digest = getDigest(self.state)
                    }
                Button(action: {
                    UIPasteboard.general.string = getDigest(self.state)
                }) {
                    Image(systemName: "doc.on.doc")
                }
            }
        }
        .environmentObject(state)
    }
    
    func getDigest(_ state: AppState) -> String {
        if (state.hashMessage.isEmpty && !state.hashMessageChanged) {
            return placeholder
        }
        
        switch self.type {
        case "sha1":
            return state.hashMessage.sha1()
            
        case "sha256":
            return state.hashMessage.sha256()
        
        case "sha256ripedm160":
            return state.hashMessage.sha256ripemd160()

        case "sha256sha256":
            return state.hashMessage.sha256sha256()
            
        case "sha512":
            return state.hashMessage.sha512()
            
        case "keccak256":
            return state.hashMessage.keccak256()

        case "keccak512":
            return state.hashMessage.keccak512()
            
        case "ripemd160":
            return state.hashMessage.ripemd160()
            
        case "blake256":
            return state.hashMessage.blake256()
        
        case "blake256ripedm160":
            return state.hashMessage.blake256ripemd160()

        case "blake256blake256":
            return state.hashMessage.blake256blake256()
            
        case "groestl512":
            return state.hashMessage.groestl512()
            
        case "groestl512groestl512":
            return state.hashMessage.groestl512groestl512()

        default:
            return "Invalid hash function \(type)"
        }
    }
}

struct HashFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        HashingItemView("sha256", "SHA-256")
    }
}
