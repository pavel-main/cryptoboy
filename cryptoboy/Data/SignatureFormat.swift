//
//  SignatureFormat.swift
//  cryptoboy
//
//  Created by Pavel on 08/04/2021.
//

import Foundation

enum SignatureFormat: CaseIterable {
    case raw
    case der

    var title: String {
        switch self {
            case .raw:
                return "R|S"
            case .der:
                return "DER"
        }
    }
}
