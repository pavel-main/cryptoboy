//
//  MessageState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation
import SwiftUI

struct MessageState {
    var hasChanged: Bool = false
    var value: String = "" {
        didSet {
            hasChanged = true
        }
    }
    
    mutating func generate() {
        value = Lorem.words(5)
    }

    func isEmpty() -> Bool {
        return value.isEmpty
    }

    func isDefault() -> Bool {
        return value.isEmpty && !hasChanged
    }

    func getHash(_ type: HashFunction) -> String {
        return value.hash(type)
    }

    func encode(_ type: EncodingFormat) -> String {
        return value.encode(type)
    }
}
