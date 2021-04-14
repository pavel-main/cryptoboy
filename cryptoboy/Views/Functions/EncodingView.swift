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
        Picker(selection: $state.isDecoding, label: Text("Mode")) {
            Text("Encoding").tag(false)
            Text("Decoding").tag(true)
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())

        Form {
            Section(header: Text("Input")) {
                HStack {
                    CopyInputButtonView({ return self.state.message }, { return self.state.isDefaultMessage(false) })

                    TextField("", text: $state.message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    ClearButtonView({ self.state.clearMessage() }, { self.state.message.isEmpty })
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
