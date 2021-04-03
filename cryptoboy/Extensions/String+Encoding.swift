//
//  String+Encoding.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import Foundation
import WalletCore

extension String {

    func hex() -> String {
        return Data(self.utf8).hexString
    }

    func encode(_ type: EncodingFormat) -> String {
        switch type {
        case .hex:
            return self.hex()

        case .base58:
            return Base58.encode(data: Data(self.utf8))

        case .base62:
            guard let integer = UInt64(self) else {
                return "NaN"
            }

            return Base62.encode(integer: integer)

        case .base64:
            return Data(self.utf8).base64EncodedString()
        }
    }

    func decode(_ format: EncodingFormat) -> String {
        switch format {
            case .hex:
                guard let bytes = Data(hexString: self) else {
                    return "Error"
                }

                return String(data: bytes, encoding: .utf8) ?? "Error"
            case .base58:
                guard let result = Base58.decode(string: self) else {
                    return "Error"
                }
                return result.hexString
            case .base62:
                return "TBD"
            case .base64:
                guard let data = Data(base64Encoded: self) else {
                    return "Error"
                }
                guard let result = String(data: data, encoding: .utf8) else {
                    return "Error"
                }
                return result
        }
    }
}
