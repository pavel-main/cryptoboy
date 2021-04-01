//
//  HashingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct HashingItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: HashFunction

    init(_ type: HashFunction) {
        self.type = type
    }

    var body: some View {
        if !state.isDefaultMessage() {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        UIPasteboard.general.string = state.getHashOrDefault(type)
                        showCopyAlert.toggle()
                    }) {
                        Text(state.getHashOrDefault(type))
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text("\(self.type.title) hash was copied to clipboard!"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
}

struct HashFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        HashingItemView(.sha256)
    }
}
