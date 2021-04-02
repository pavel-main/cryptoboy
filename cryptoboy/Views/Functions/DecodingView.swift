//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct DecodingView: View {
    @State private var message = ""
    @State private var format = EncodingFormat.hex

    @State private var showCopyAlert = false

    var body: some View {
        Form {
            Section(header: Text("Encoded Message")) {
                HStack {
                    TextEditor(text: $message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Button(action: { message = "" }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .disabled(message.isEmpty)
                }
            }
            Section(header: Text("Encoding Format")) {
                Picker(selection: $format, label: Text("Encoding Format")) {
                    Text("Hexadecimal").tag(EncodingFormat.hex)
                    Text("Base58").tag(EncodingFormat.base58)
                    Text("Base64").tag(EncodingFormat.base64)
                    // Text("Binary").tag(EncodingFormat.bin)
                }
            }

            if !message.isEmpty {
                Section(header: Text("Decoded Message")) {
                    HStack {
                        Button(action: {
                            UIPasteboard.general.string = message.decode(format)
                            showCopyAlert.toggle()
                        }) {
                            Text(message.decode(format))
                        }
                        .alert(isPresented: $showCopyAlert) {
                            Alert(
                                title: Text("Copied to clipboard"),
                                message: Text(message.decode(format)),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    }
                }
            }
        }
        .modifier(NavigationViewModifier(page: .decoding))
    }
}
