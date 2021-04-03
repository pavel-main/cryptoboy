//
//  Data+Hashing.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.
//

import Foundation
import WalletCore

extension Data {

    init?(fromHexEncodedString string: String) {

        // Convert 0 ... 9, a ... f, A ...F to their decimal value,
        // return nil for all other input characters
        func decodeNibble(u: UInt16) -> UInt8? {
            switch(u) {
            case 0x30 ... 0x39:
                return UInt8(u - 0x30)
            case 0x41 ... 0x46:
                return UInt8(u - 0x41 + 10)
            case 0x61 ... 0x66:
                return UInt8(u - 0x61 + 10)
            default:
                return nil
            }
        }

        self.init(capacity: string.utf16.count/2)
        var even = true
        var byte: UInt8 = 0
        for c in string.utf16 {
            guard let val = decodeNibble(u: c) else { return nil }
            if even {
                byte = val << 4
            } else {
                byte += val
                self.append(byte)
            }
            even = !even
        }
        guard even else { return nil }
    }
    
    func hash(_ type: HashFunction) -> String {
        switch type {
        case .sha1:
            return Hash.sha1(data: self).hexString

        case .sha256:
            return Hash.sha256(data: self).hexString

        case .sha256ripedm160:
            return Hash.sha256RIPEMD(data: self).hexString

        case .sha256sha256:
            return Hash.sha256SHA256(data: self).hexString

        case .sha512:
            return Hash.sha512(data: self).hexString

        case .keccak256:
            return Hash.keccak256(data: self).hexString

        case .keccak512:
            return Hash.keccak512(data: self).hexString

        case .ripemd160:
            return Hash.ripemd(data: self).hexString

        case .blake256:
            return Hash.blake256(data: self).hexString

        case .blake256ripedm160:
            return Hash.blake256RIPEMD(data: self).hexString

        case .blake256blake256:
            return Hash.blake256Blake256(data: self).hexString

        case .groestl512:
            return Hash.groestl512(data: self).hexString

        case .groestl512groestl512:
            return Hash.groestl512Groestl512(data: self).hexString
        }
    }
}
