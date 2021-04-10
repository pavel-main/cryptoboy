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
        if !state.isDefaultMessage(self.isBinary) {
            CopyAlertTextView(self.type.title, { return getHash() })
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
