// Copyright © 2017-2020 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

public enum Curve: UInt32, CaseIterable, CustomStringConvertible  {
    case secp256k1 = 0
    case ed25519 = 1
    case ed25519HD = 2
    case ed25519Blake2bNano = 3
    case curve25519 = 4
    case nist256p1 = 5
    case ed25519Extended = 6

    public var description: String {
        switch self {
        case .secp256k1: return "secp256k1"
        case .ed25519: return "ed25519"
        case .ed25519HD: return "ed25519-hd"
        case .ed25519Blake2bNano: return "ed25519-blake2b-nano"
        case .curve25519: return "curve25519"
        case .nist256p1: return "nist256p1"
        case .ed25519Extended: return "ed25519-cardano-seed"
        }
    }
}
