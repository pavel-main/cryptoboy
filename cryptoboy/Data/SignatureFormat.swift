//
//  SignatureFormat.swift
//  cryptoboy
//
//  Created by Pavel on 08/04/2021.
//

import Foundation

enum SignatureFormat: CaseIterable {
    case raw
    case asn1
    case schnorr

    var title: String {
        switch self {
            case .raw:
                return "Raw (R|S)"
            case .asn1:
                return "ASN.1 (DER)"
            case .schnorr:
                return "Schnorr"
        }
    }
}
