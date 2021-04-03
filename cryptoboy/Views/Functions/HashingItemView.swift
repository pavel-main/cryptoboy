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
                        UIPasteboard.general.string = getHash()
                        showCopyAlert.toggle()
                    }) {
                        Text(getHash())
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(getHash()),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
    
    func getHash() -> String {
        return self.state.getHashOrDefault(self.type)
    }
}
