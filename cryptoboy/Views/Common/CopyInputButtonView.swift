//
//  CopyInputButtonView.swift
//  cryptoboy
//
//  Created by Pavel on 14/04/2021.
//

import Foundation
import SwiftUI

struct CopyInputButtonView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    let MESSAGE_LIMIT = 64

    var systemImage: String = "doc.on.doc"
    var callback: () -> String
    var disabled: () -> Bool

    init(_ callback: @escaping () -> String) {
        self.callback = callback
        self.disabled = {
            return false
        }
    }

    init(_ callback: @escaping () -> String, _ disabled: @escaping () -> Bool) {
        self.callback = callback
        self.disabled = disabled
    }

    var body: some View {
        HStack {
            Button(action: {
                let value = callback()
                ClipboardHelper.copyString(value)
                showCopyAlert.toggle()
                state.clipboard.insert(value, at: 0)
            }) {
                Image(systemName: systemImage)
            }
            .disabled(self.disabled())
            .buttonStyle(BorderlessButtonStyle())
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text(prefixCallback()),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    func prefixCallback() -> String {
        let result = callback()
        if result.count > MESSAGE_LIMIT {
            return result.prefix(MESSAGE_LIMIT) + "..."
        }

        return result
    }
}
