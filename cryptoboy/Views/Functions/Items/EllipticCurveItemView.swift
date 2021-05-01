//
//  EllipticCurvePublicKeyView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import SwiftUI

struct EllipticCurveItemView: View {
    @EnvironmentObject var state: AppState

    var type: EllipticCurvePublicKey

    init(_ type: EllipticCurvePublicKey) {
        self.type = type
    }

    var body: some View {
        CopyAlertTextView(type.title, { return state.keypair.getPublic(type) })
    }
}
