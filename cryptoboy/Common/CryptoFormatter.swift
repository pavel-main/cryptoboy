//
//  CryptoFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import Foundation
import SwiftUI

class CryptoFormatter {
    static var bitcoin = createFormatter(0, 8)
    static var milliBTC = createFormatter(0, 5)
    static var microBTC = createFormatter(0, 2)
    static var satoshi = createFormatter(0, 0)
    
    static var ether = createFormatter(0, 18)
    static var milliether = createFormatter(0, 15)
    static var microether = createFormatter(0, 12)
    static var gwei = createFormatter(0, 9)
    static var mwei = createFormatter(0, 6)
    static var kwei = createFormatter(0, 3)
    static var wei = createFormatter(0, 0)
    
    static func createFormatter(_ min: Int, _ max: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.generatesDecimalNumbers = true
        formatter.usesGroupingSeparator = false
        formatter.minimumFractionDigits = min
        formatter.maximumFractionDigits = max
        return formatter
    }
}
