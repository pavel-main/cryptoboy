//
//  BaseUnit.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import SwiftUI

struct BaseUnit {
    var title: String
    var base: Int
    var whitelist: String
    var current: String
    var isHex: Bool

    init(title: String, base: Int, current: String, whitelist: String, isHex: Bool) {
        self.title = title
        self.base = base
        self.current = current
        self.whitelist = whitelist
        self.isHex = isHex
    }
}
