//
//  EncodingFormat.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import Foundation

enum EncodingFormat {
    case hex
    case base58
    case base62
    case base64

    var title: String {
        switch self {
            case .hex:
                return "Hexadecimal"
            case .base58:
                return "Base58"
            case .base62:
                return "Base62"
            case .base64:
                return "Base64"
        }
    }
}
