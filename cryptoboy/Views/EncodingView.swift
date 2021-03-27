//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct EncodingView: View {
    @State private var input = ""
    
    var body: some View {
        Form {
            Section(header: Text("Input Text")) {
                TextField("", text: $input)
            }
            
            Section(header: Text("SHA-256")) {
                Text("\(input.sha256())")
            }
        }
    }
}
