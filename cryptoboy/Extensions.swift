//
//  Extensions.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import Foundation
import WalletCore

extension String {

    func hex() -> String {
        return Data(self.utf8).hexString
    }
    
    func sha1() -> String {
        return Hash.sha1(data: Data(self.utf8)).hexString
    }
    
    func sha256() -> String {
        return Hash.sha256(data: Data(self.utf8)).hexString
    }
    
    func keccak256() -> String {
        return Hash.keccak256(data: Data(self.utf8)).hexString
    }
    
    func ripemd160() -> String {
        return Hash.ripemd(data: Data(self.utf8)).hexString
    }
}
