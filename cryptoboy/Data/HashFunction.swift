//
//  HashFunction.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

enum HashFunction {
    case bytepad
    case sha1
    case sha256
    case sha512
    case ripemd160
    case keccak256
    case keccak512
    case blake256
    case groestl512

    case sha256ripedm160
    case sha256sha256
    case blake256ripedm160
    case blake256blake256
    case groestl512groestl512

    var title: String {
        switch self {
            case .bytepad:
                return "Original bytes"
            case .sha1:
                return "SHA-1"
            case .sha256:
                return "SHA-256"
            case .sha512:
                return "SHA-512"
            case .ripemd160:
                return "RIPEMD-160"
            case .keccak256:
                return "Keccak-256"
            case .keccak512:
                return "Keccak-512"
            case .blake256:
                return "BLAKE-256"
            case .groestl512:
                return "Grøstl-512"
            case .sha256ripedm160:
                return "SHA-256 + RIPEMD-160"
            case .sha256sha256:
                return "Double SHA-256"
            case .blake256ripedm160:
                return "BLAKE-256 + RIPEMD-160"
            case .blake256blake256:
                return "Double BLAKE-256"
            case .groestl512groestl512:
                return "Double Grøstl-512"
        }
    }
}
