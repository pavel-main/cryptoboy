//
//  EncodingFormat.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

enum EncodingFormat {
    case bin
    case hex
    case base58
    case base64
    case rot13
    
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
            case .rot13:
                return "ROT13"
        }
    }
}
