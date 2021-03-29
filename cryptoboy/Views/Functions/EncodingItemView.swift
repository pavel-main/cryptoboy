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

    var type: String
    var title: String
    
    init(_ type: String, _ title: String) {
        self.type = type
        self.title = title
    }
    
    var body: some View {
        if (!state.isDefaultMessage()) {
            Section(header: Text(self.title)) {
                HStack {
                    Button(action: {
                        UIPasteboard.general.string = state.encodeOrDefault(type, title)
                        showCopyAlert.toggle()
                    }) {
                        Text(state.encodeOrDefault(type, title))
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text("\(title) was copied to clipboard!"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
}

struct EncodingItemView_Previews: PreviewProvider {
    static var previews: some View {
        EncodingItemView("hex", "Hexadecimal")
    }
}

