//
//  EllipticCurvePublicKeyView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import SwiftUI

struct EllipticCurveItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: EllipticCurvePublicKey

    init(_ type: EllipticCurvePublicKey) {
        self.type = type
    }

    var body: some View {
        Section(header: Text(self.type.title)) {
            HStack {
                Button(action: {
                    ClipboardHelper.copyString(state.publicKeyOrDefault(type))
                    showCopyAlert.toggle()
                }) {
                    Text(state.publicKeyOrDefault(type))
                }
            }
        }
        .alert(isPresented: $showCopyAlert) {
            Alert(
                title: Text("Copied to clipboard"),
                message: Text(state.publicKeyOrDefault(type)),
                dismissButton: .default(Text("OK"))
            )
        }
        .environmentObject(state)
    }
}
