//
//  ClipboardHelper.swift
//  cryptoboy
//
//  Created by Pavel on 11/04/2021.
//

import Foundation
import SwiftUI

class ClipboardHelper {
    
    static func setString(_ input: String) {
        UIPasteboard.general.string = input
    }

    static func resetString() {
        UIPasteboard.general.items.removeAll()
    }

    static func getString() -> String {
        return UIPasteboard.general.string ?? ""
    }
    
    static func isEmpty() -> Bool {
        return !UIPasteboard.general.hasStrings
    }
}
