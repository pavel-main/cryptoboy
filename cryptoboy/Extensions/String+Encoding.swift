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

        case .base64:
            return Data(self.utf8).base64EncodedString()
        }
    }

    func decode(_ format: EncodingFormat) -> String? {
        switch format {
            case .hex:
                guard let bytes = Data(fromHexEncodedString: self) else {
                    return nil
                }

                return String(data: bytes, encoding: .utf8) ?? nil
            case .base58:
                guard let result = Base58.decode(string: self) else {
                    return nil
                }
                return result.hexString
            case .base64:
                guard let data = Data(base64Encoded: self) else {
                    return nil
                }
                guard let result = String(data: data, encoding: .utf8) else {
                    return nil
                }
                return result
        }
    }
}
