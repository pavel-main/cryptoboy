//
//  DecodingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.

import SwiftUI

struct DecodingItemView: View {
    @EnvironmentObject var state: AppState

    var type: EncodingFormat

    init(_ type: EncodingFormat) {
        self.type = type
    }

    var body: some View {
        if !decode().isEmpty {
            CopyAlertTextView(self.type.title, { return self.decode() })
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
