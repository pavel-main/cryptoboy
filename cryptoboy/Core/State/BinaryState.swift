//
//  MessageState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation
import SwiftUI

struct BinaryState {
    var hasChanged: Bool = false
    var value: String = "" {
        didSet {
            hasChanged = true
        }
    }

    func isEmpty() -> Bool {
        return value.isEmpty
    }

    func isDefault() -> Bool {
        return value.isEmpty && !hasChanged
    }

    func getHash(_ type: HashFunction) -> String? {
        guard let data = Data(fromHexEncodedString: value.bytepad()) else {
            return nil
        }

        return data.hash(type).hexString
    }
}
