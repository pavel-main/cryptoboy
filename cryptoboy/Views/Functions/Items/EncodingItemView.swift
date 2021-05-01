//
//  EncodingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct EncodingItemView: View {
    @EnvironmentObject var state: AppState

    var type: EncodingFormat

    init(_ type: EncodingFormat) {
        self.type = type
    }

    var body: some View {
        if !state.message.isDefault() {
            CopyAlertTextView(type.title, { return state.message.encode(type) })
        }
    }
}
