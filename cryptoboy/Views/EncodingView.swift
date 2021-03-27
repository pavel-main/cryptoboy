//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct EncodingView: View {
    @State private var input = ""
    @State private var sha256 = ""
    
    var body: some View {
        Form {
            Section(header: Text("Input Text")) {
                TextEditor(text: $input)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onChange(of: input) { newValue in
                        sha256 = input.sha256()
                    }
            }
            
            Section(header: Text("SHA-256")) {
                HStack {
                    Image(systemName: "lock")
                    TextField("SHA-256", text: $sha256)
                }
            }
        }
    }
}
