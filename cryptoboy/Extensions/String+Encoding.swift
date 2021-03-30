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
    
    func bin() -> String {
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
            return self.bin()
        
        case .hex:
            return self.hex()
            
        case .base58:
            return Base58.encode(data: Data(self.utf8))

        case .base64:
            return Data(self.utf8).base64EncodedString()
            
        case .rot13:
            return ROT13.string(self)
        }
    }
}
