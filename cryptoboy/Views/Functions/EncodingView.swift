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
                    Image(systemName: "ellipsis.bubble")

                    TextField("", text: $state.message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Button(action: state.clearMessage) {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .disabled(state.message.isEmpty)
                }
            }

            EncodingItemView(.hex)
            EncodingItemView(.base58)
            //EncodingItemView(.base62)
            EncodingItemView(.base64)
        }
        .modifier(NavigationViewModifier(page: .encoding))
    }
}
