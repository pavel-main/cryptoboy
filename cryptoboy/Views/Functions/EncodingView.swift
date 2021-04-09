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
            Section(header: Text("Mode")) {
                Picker(selection: $state.isDecoding, label: Text("Mode")) {
                    Text("Encoding").tag(false)
                    Text("Decoding").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Input")) {
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

            if !state.isDecoding {
                EncodingItemView(.hex)
                EncodingItemView(.base58)
                EncodingItemView(.base64)
            } else {
                DecodingItemView(.hex)
                DecodingItemView(.base58)
                DecodingItemView(.base64)
            }

        }
        .modifier(NavigationViewModifier(page: .encoding))
    }
}
