//
//  EncodingFormat.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import Foundation
import WalletCore

enum EncodingFormat {
    case bin
    case hex
    case base58
    case base64

    var title: String {
        switch self {
            case .bin:
                return "Binary"
            case .hex:
                return "Hexadecimal"
            case .base58:
                return "Base58"
            case .base64:
                return "Base64"
        }
    }
}
