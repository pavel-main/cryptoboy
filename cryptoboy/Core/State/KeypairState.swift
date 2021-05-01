//
//  KeypairState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation
import SwiftUI
import WalletCore

struct KeypairState {
    var privateKey: PrivateKey?

    func isEmpty() -> Bool {
        return privateKey == nil
    }

    func getPrivate() -> String {
        return privateKey?.data.hexString ?? ""
    }

    func getPublic(_ type: EllipticCurvePublicKey) -> String {
        guard let privKey = privateKey else {
            return ""
        }

        return type.getPublicKey(from: privKey).description
    }
}
