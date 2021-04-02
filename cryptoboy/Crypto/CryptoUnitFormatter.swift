//
//  CryptoFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import Foundation
import SwiftRadix
import SwiftUI

class CryptoUnitFormatter {
    /**
     * Creates new formatter with `maxFractionDigits`
     */
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

    /**
     * Updates all units with `newValue` passed at `idx`
     */
    static func updateBaseUnits(_ rawUnits: [BaseUnit], _ idx: Int, _ newValue: String) -> [BaseUnit] {
        // Save old value
        var units = rawUnits

        // Validate input
        let filteredInput = newValue.uppercased().filter { units[idx].whitelist.contains($0) }

        // Convert to radix value with current base
        let radix = filteredInput.radix(base: units[idx].base) ?? 0.binary

        // Calculate all values based on input
        for (jdx, item) in units.enumerated() {
            units[jdx].current = radix.value.radix(base: item.base).stringValue
        }

        return units
    }

    /**
     * Updates all units with `newValue` passed at `idx`
     */
    static func updateUnits(_ rawUnits: [MinorUnit], _ idx: Int, _ newValue: String) -> [MinorUnit] {
        // Save old value
        var units = rawUnits
        let oldValue = units[idx].current

        // Replace localized commas with dots
        let filteredInput = newValue.replace(target: ",", with: ".").filter { "0123456789.".contains($0) }

        // Don't allow multiple dots
        let dotsCount = filteredInput.filter { $0 == "." }.count
        if dotsCount > 1 {
            units[idx].current = oldValue
            return units
        }

        // Allow trailing zeroes
        let oldVal = Decimal(string: units[idx].current)
        let newVal = Decimal(string: filteredInput)
        if oldVal == newVal {
            units[idx].current = filteredInput
            return units
        }

        // Calculate input value in minor units
        let decimalValue = Decimal(string: filteredInput) ?? Decimal.zero
        let minorValue = decimalValue * pow(10, units[idx].factor)

        // Calculate all values based on input
        for (jdx, item) in units.enumerated() {
            let unitValue = minorValue / pow(10, item.factor)
            let result = item.formatter.string(for: unitValue) ?? "0"
            units[jdx].current = result
        }

        return units
    }
}
