//
//  Operation.swift
//  cryptoboy
//
//  Created by Pavel on 09/04/2021.
//

import Foundation

enum BigOperation: String, CaseIterable, Identifiable {
    case plus
    case minus
    case mul
    case div
    
    var id: String {
        return self.rawValue
    }
    
    var title: String {
        switch self {
            case .plus:
                return "+"
            case .minus:
                return "-"
            case .mul:
                return "*"
            case .div:
                return "/"
        }
    }
}
