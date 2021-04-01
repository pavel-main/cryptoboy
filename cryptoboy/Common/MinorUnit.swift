//
//  MinorUnit.swift
//  cryptoboy
//
//  Created by Pavel on 01/04/2021.
//

import Foundation

struct MinorUnit {
    var title: String
    var factor: Int
    var formatter: NumberFormatter
    var current: String

    init(title: String, factor: Int, max: Int) {
        self.title = title
        self.factor = factor
        self.formatter = CryptoUnitFormatter.build(factor)

        let defaultValue = pow(10, max) / pow(10, factor)
        self.current = defaultValue.description
    }
}
