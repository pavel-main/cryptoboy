//
//  DecodingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.

import SwiftUI

struct DecodingItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: EncodingFormat

    init(_ type: EncodingFormat) {
        self.type = type
    }

    var body: some View {
        if !decode().isEmpty {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        UIPasteboard.general.string = decode()
                        showCopyAlert.toggle()
                    }) {
                        Text(decode())
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(decode()),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }

    private func decode() -> String {
        if state.isDefaultMessage(false) {
           return ""
        }

        guard let message = self.state.message.decode(self.type) else {
            return ""
        }

        return message
    }
}
