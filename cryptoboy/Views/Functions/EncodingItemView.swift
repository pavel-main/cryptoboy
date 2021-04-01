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
        if !state.isDefaultMessage() {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        UIPasteboard.general.string = state.encodeOrDefault(type)
                        showCopyAlert.toggle()
                    }) {
                        Text(state.encodeOrDefault(type))
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text("\(self.type.title) was copied to clipboard!"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
}

struct EncodingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EncodingItemView(.hex)
    }
}
