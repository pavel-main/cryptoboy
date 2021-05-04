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
        Picker(selection: $state.isDecode, label: Text("Mode")) {
            Text("Encoding").tag(false)
            Text("Decoding").tag(true)
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())

        Form {
            Section(header: Text("Input")) {
                HStack {
                    CopyInputButtonView({ return state.message.value }, { return state.message.isDefault() })

                    TextField("", text: $state.message.value)
                        .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.resetMessage() }, { state.message.isDefault() })
                }
                
                Button(action: { state.message.generate() }) {
                    Text("Generate New")
                }
            }

            if !state.isDecode {
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
