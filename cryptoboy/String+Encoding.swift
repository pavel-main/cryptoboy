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
    
    func encode(_ type: String) -> String {
        switch type {
        case "hex":
            return self.hex()
            
        case "base58":
            return Base58.encode(data: Data(self.utf8))

        case "base64":
            return Data(self.utf8).base64EncodedString()

        default:
            return "Invalid hash function \(type)"
        }
    }
}
