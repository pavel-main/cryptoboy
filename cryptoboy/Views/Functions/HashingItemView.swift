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
        // self.digest = state.getDigest(type, placeholder)
    }
    
    var body: some View {
        Section(header: Text(self.type)) {
            HStack {
                Image(systemName: "number")
                TextField(self.placeholder, text: $digest)
                    .disabled(true)
                    .onChange(of: state.message) { newValue in
                        digest = state.getDigest(type, placeholder)
                    }
                Button(action: {
                    UIPasteboard.general.string = state.getDigest(type, placeholder)
                }) {
                    Image(systemName: "doc.on.doc")
                }
            }
        }
        .environmentObject(state)
    }
}

struct HashFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        HashingItemView("sha256", "SHA-256")
    }
}
