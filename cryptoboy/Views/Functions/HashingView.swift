//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashingView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        Picker(selection: $state.isBinary, label: Text("Input Type")) {
            Text("String").tag(false)
            Text("Hex Bytes").tag(true)
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())

        Form {
            Section(header: Text("Input")) {
                HStack {
                    if !state.isBinary {
                        CopyInputButtonView({ return state.message.value }, { return state.message.isDefault() })

                        TextField("", text: $state.message.value)
                            .modifier(SimpleKeyboardViewModifier())

                        ClearButtonView({ state.resetMessage() }, { state.message.isDefault() })
                    } else {
                        CopyInputButtonView({ return state.bytes.value }, { return state.bytes.isDefault() })

                        TextField("", text: Binding(
                            get: {
                                return state.bytes.value
                            },
                            set: { (newValue) in
                                let input = newValue.lowercased().filter { "0123456789abcdef".contains($0) }
                                state.bytes.value = input
                            })
                        )
                        .modifier(HexKeyboardViewModifier(hex: true))

                        ClearButtonView({ state.resetBytes() }, { state.bytes.isDefault() })
                    }
                }
            }

            if !state.isBinary {
                Group {
                    HashingItemView(.sha256, false)
                    HashingItemView(.sha512, false)
                    HashingItemView(.keccak256, false)
                    HashingItemView(.keccak512, false)
                    HashingItemView(.ripemd160, false)
                    HashingItemView(.sha256ripedm160, false)
                    HashingItemView(.sha256sha256, false)
                }
            } else {
                Group {
                    HashingItemView(.bytepad, true)
                    HashingItemView(.sha256, true)
                    HashingItemView(.sha512, true)
                    HashingItemView(.keccak256, true)
                    HashingItemView(.keccak512, true)
                    HashingItemView(.ripemd160, true)
                    HashingItemView(.sha256ripedm160, true)
                    HashingItemView(.sha256sha256, true)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .hash))
    }
}
