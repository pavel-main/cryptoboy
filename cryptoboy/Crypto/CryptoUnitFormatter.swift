//
//  CryptoFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import Foundation
import SwiftUI

class CryptoUnitFormatter {
    // BTC
    static var bitcoin = build(8)
    static var milliBTC = build(5)
    static var microBTC = build(2)
    static var satoshi = build(0)
    
    // ETH
    static var ether = build(18)
    static var milliether = build(15)
    static var microether = build(12)
    static var gwei = build(9)
    static var mwei = build(6)
    static var kwei = build(3)
    static var wei = build(0)
    
    static func build(_ maxFractionDigits: Int) -> NumberFormatter {
        let fmt = NumberFormatter()
        fmt.locale = Locale(identifier: "en_US")
        fmt.numberStyle = .decimal
        fmt.generatesDecimalNumbers = true
        fmt.usesGroupingSeparator = false
        fmt.minimumFractionDigits = 0
        fmt.maximumFractionDigits = maxFractionDigits
        fmt.roundingMode = .down
        return fmt
    }
}
