//
//  ClipboardHelper.swift
//  cryptoboy
//
//  Created by Pavel on 11/04/2021.
//

import Foundation
import SwiftUI

class ClipboardHelper {

    static func copyString(_ input: String) {
        UIPasteboard.general.string = input
    }
    
    static func getString() -> String? {
        return UIPasteboard.general.string
    }
}
