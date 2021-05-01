//
//  HashingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct HashingItemView: View {
    @EnvironmentObject var state: AppState

    var type: HashFunction
    var isBinary: Bool

    init(_ type: HashFunction, _ isBinary: Bool) {
        self.type = type
        self.isBinary = isBinary
    }

    var body: some View {
        if !isDefault() {
            CopyAlertTextView(type.title, { return getHash() })
        }
    }

    func isDefault() -> Bool {
        if isBinary {
            return state.bytes.isDefault()
        }

        return state.message.isDefault()
    }

    func getHash() -> String {
        if isBinary {
            guard let hash = state.bytes.getHash(type) else {
                return ""
            }

            return hash
        }

        return state.message.getHash(type)
    }
}
