//
//  CopyAlertTextView.swift
//  cryptoboy
//
//  Created by Pavel on 11/04/2021.
//

import Foundation
import SwiftUI

struct CopyAlertTextView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var title: String
    var callback: () -> String
    var alignment: TextAlignment

    init(_ title: String, _ callback: @escaping () -> String, _ alignment: TextAlignment = .leading) {
        self.title = title
        self.callback = callback
        self.alignment = alignment
    }

    var body: some View {
        Section(header: Text(self.title)) {
            HStack {
                Button(action: {
                    ClipboardHelper.copyString(callback())
                    showCopyAlert.toggle()
                }) {
                    Text(callback())
                        .multilineTextAlignment(self.alignment)
                }
            }
        }
        .alert(isPresented: $showCopyAlert) {
            Alert(
                title: Text("Copied to clipboard"),
                message: Text(callback()),
                dismissButton: .default(Text("OK"))
            )
        }
        .environmentObject(state)
    }
}
