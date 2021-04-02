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

    func binary() -> String {
        let st = self
        var result = ""
        for char in st.utf8 {
            var tranformed = String(char, radix: 2)
            while tranformed.count < 8 {
                tranformed = "0" + tranformed
            }
            let binary = "\(tranformed) "
            result.append(binary)
        }
        return result
    }

    func encode(_ type: EncodingFormat) -> String {
        switch type {
        case .bin:
            return self.binary()

        case .hex:
            return self.hex()

        case .base58:
            return Base58.encode(data: Data(self.utf8))

        case .base64:
            return Data(self.utf8).base64EncodedString()
        }
    }

    func decode(_ format: EncodingFormat) -> String {
        switch format {
            case .bin:
                return "Not implemented yet"
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
