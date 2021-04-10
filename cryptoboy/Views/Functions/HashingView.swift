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
        Form {
            Section(header: Text("Input Type")) {
                Picker(selection: $state.isMessageBinary, label: Text("Input Type")) {
                    Text("String").tag(false)
                    Text("Hex Bytes").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Input")) {
                HStack {
                    if !state.isMessageBinary {
                        Image(systemName: "ellipsis.bubble")

                        TextField("", text: $state.message)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)

                        Button(action: state.clearMessage) {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .disabled(state.isDefaultMessage(false))
                    } else {
                        Image(systemName: "01.square")

                        TextField("", text: Binding(
                            get: {
                                return self.state.messageBytes
                            },
                            set: { (newValue) in
                                let input = newValue.lowercased().filter { "0123456789abcdef".contains($0) }
                                self.state.messageBytes = input
                            })
                        )
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.namePhonePad)

                        Button(action: state.clearMessageBytes) {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .disabled(state.isDefaultMessage(true))
                    }
                }
            }

            if !state.isMessageBinary {
                Group {
                    HashingItemView(.sha1, false)
                    HashingItemView(.sha256, false)
                    HashingItemView(.sha512, false)
                    HashingItemView(.keccak256, false)
                    HashingItemView(.keccak512, false)
                    HashingItemView(.ripemd160, false)
                    HashingItemView(.blake256, false)
                    HashingItemView(.groestl512, false)
                }

                Group {
                    HashingItemView(.sha256ripedm160, false)
                    HashingItemView(.sha256sha256, false)
                    HashingItemView(.blake256ripedm160, false)
                    HashingItemView(.blake256blake256, false)
                    HashingItemView(.groestl512groestl512, false)
                }
            } else {
                Group {
                    HashingItemView(.bytepad, true)
                    HashingItemView(.sha1, true)
                    HashingItemView(.sha256, true)
                    HashingItemView(.sha512, true)
                    HashingItemView(.keccak256, true)
                    HashingItemView(.keccak512, true)
                    HashingItemView(.ripemd160, true)
                    HashingItemView(.blake256, true)
                    HashingItemView(.groestl512, true)
                }

                Group {
                    HashingItemView(.sha256ripedm160, true)
                    HashingItemView(.sha256sha256, true)
                    HashingItemView(.blake256ripedm160, true)
                    HashingItemView(.blake256blake256, true)
                    HashingItemView(.groestl512groestl512, true)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .hash))
    }
}
