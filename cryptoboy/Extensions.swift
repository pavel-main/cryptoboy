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
    
    func sha256sha256() -> String {
        return Hash.sha256SHA256(data: Data(self.utf8)).hexString
    }
    
    func sha256ripemd160() -> String {
        return Hash.sha256RIPEMD(data: Data(self.utf8)).hexString
    }
    
    func sha512() -> String {
        return Hash.sha512(data: Data(self.utf8)).hexString
    }
    
    func keccak256() -> String {
        return Hash.keccak256(data: Data(self.utf8)).hexString
    }
    
    func keccak512() -> String {
        return Hash.keccak512(data: Data(self.utf8)).hexString
    }
    
    func ripemd160() -> String {
        return Hash.ripemd(data: Data(self.utf8)).hexString
    }
    
    func blake256() -> String {
        return Hash.blake256(data: Data(self.utf8)).hexString
    }
    
    func blake256blake256() -> String {
        return Hash.blake256Blake256(data: Data(self.utf8)).hexString
    }
    
    func blake256ripemd160() -> String {
        return Hash.blake256RIPEMD(data: Data(self.utf8)).hexString
    }
    
    func groestl512() -> String {
        return Hash.groestl512(data: Data(self.utf8)).hexString
    }
    
    func groestl512groestl512() -> String {
        return Hash.groestl512Groestl512(data: Data(self.utf8)).hexString
    }
}
