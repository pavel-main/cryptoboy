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
    var isBinary: Bool

    init(_ type: HashFunction, _ isBinary: Bool) {
        self.type = type
        self.isBinary = isBinary
    }

    var body: some View {
        if !state.isDefaultMessage(self.isBinary) {
            Section(header: Text(self.type.title)) {
                HStack {
                    Button(action: {
                        ClipboardHelper.copyString(getHash())
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
        if self.isBinary {
            guard let hash = self.state.getBinaryHash(self.type) else {
                return ""
            }

            return hash
        }

        return self.state.getHash(self.type)
    }
}
