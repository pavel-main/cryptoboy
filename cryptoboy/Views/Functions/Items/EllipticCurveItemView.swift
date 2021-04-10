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
        CopyAlertTextView(self.type.title, { return self.state.publicKeyOrDefault(self.type) })
    }
}
