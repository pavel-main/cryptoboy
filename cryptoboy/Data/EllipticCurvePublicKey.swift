//
//  EllipticCurvePublicKey.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import WalletCore

enum EllipticCurvePublicKey {
    case secp256k1(compressed: Bool)
    case ed25519
    case ed25519blake2b
    case curve25519
    case nist256p1

    var title: String {
        switch self {
            case .secp256k1:
                return "secp256k1"
            case .ed25519:
                return "ed25519 sha512"
            case .ed25519blake2b:
                return "ed25519 blake2b"
            case .curve25519:
                return "curve25591"
            case .nist256p1:
                return "nist256p1"
        }
    }

    func getPublicKey(from privateKey: PrivateKey) -> PublicKey {
        switch self {
            case .secp256k1(let isCompressed):
                return privateKey.getPublicKeySecp256k1(compressed: isCompressed)
            case .ed25519:
                return privateKey.getPublicKeyEd25519()
            case .ed25519blake2b:
                return privateKey.getPublicKeyEd25519Blake2b()
            case .curve25519:
                return privateKey.getPublicKeyCurve25519()
            case .nist256p1:
                return privateKey.getPublicKeyNist256p1()
        }
    }
}
