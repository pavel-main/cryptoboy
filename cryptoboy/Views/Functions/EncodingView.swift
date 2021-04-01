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

            EncodingItemView(.hex)
            EncodingItemView(.base58)
            EncodingItemView(.base64)
            EncodingItemView(.rot13)
            EncodingItemView(.bin)
        }
        .modifier(NavigationViewModifier(page: .encoding))
    }
}
