//
//  Extensions.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import Foundation
import WalletCore

extension String {

    func hash(_ type: HashFunction) -> String {
        switch type {
        case .sha1:
            return Hash.sha1(data: Data(self.utf8)).hexString

        case .sha256:
            return Hash.sha256(data: Data(self.utf8)).hexString

        case .sha256ripedm160:
            return Hash.sha256RIPEMD(data: Data(self.utf8)).hexString

        case .sha256sha256:
            return Hash.sha256SHA256(data: Data(self.utf8)).hexString

        case .sha512:
            return Hash.sha512(data: Data(self.utf8)).hexString

        case .keccak256:
            return Hash.keccak256(data: Data(self.utf8)).hexString

        case .keccak512:
            return Hash.keccak512(data: Data(self.utf8)).hexString

        case .ripemd160:
            return Hash.ripemd(data: Data(self.utf8)).hexString

        case .blake256:
            return Hash.blake256(data: Data(self.utf8)).hexString

        case .blake256ripedm160:
            return Hash.blake256RIPEMD(data: Data(self.utf8)).hexString

        case .blake256blake256:
            return Hash.blake256Blake256(data: Data(self.utf8)).hexString

        case .groestl512:
            return Hash.groestl512(data: Data(self.utf8)).hexString

        case .groestl512groestl512:
            return Hash.groestl512Groestl512(data: Data(self.utf8)).hexString
        }
    }
}
