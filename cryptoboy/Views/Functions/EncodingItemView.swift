//
//  EncodingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct EncodingItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: EncodingFormat

    init(_ type: EncodingFormat) {
        self.type = type
    }

    var body: some View {
        if !state.isDefaultMessage(false) {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        ClipboardHelper.copyString(state.encode(type))
                        showCopyAlert.toggle()
                    }) {
                        Text(state.encode(type))
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(state.encode(type)),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
}
