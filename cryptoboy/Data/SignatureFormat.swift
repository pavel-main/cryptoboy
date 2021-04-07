//
//  SignatureFormat.swift
//  cryptoboy
//
//  Created by Pavel on 08/04/2021.
//

import Foundation

enum SignatureFormat: CaseIterable {
    case asn1
    case der

    var title: String {
        switch self {
            case .asn1:
                return "ASN.1"
            case .der:
                return "DER"
        }
    }
}
