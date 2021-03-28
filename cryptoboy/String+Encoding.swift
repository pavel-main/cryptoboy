//
//  String+Encoding.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import Foundation
import WalletCore

import WalletCore

extension String {
    
    func hex() -> String {
        return Data(self.utf8).hexString
    }
}
