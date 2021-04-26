//
//  ClipboardItemView.swift
//  cryptoboy
//
//  Created by Pavel on 26/04/2021.
//

import Foundation
import SwiftUI

struct ClipboardItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    let MESSAGE_LIMIT = 64

    var value: String

    init(_ value: String) {
        self.value = value
    }

    var body: some View {
        HStack {
            Image(systemName: "mail")
            Button(action: {
                ClipboardHelper.copyString(value)
                showCopyAlert.toggle()
            }) {
                Text(value)
                    .multilineTextAlignment(.leading)
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(prefixValue()),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .environmentObject(state)
    }

    func prefixValue() -> String {
        if value.count > MESSAGE_LIMIT {
            return value.prefix(MESSAGE_LIMIT) + "..."
        }

        return value
    }
}
