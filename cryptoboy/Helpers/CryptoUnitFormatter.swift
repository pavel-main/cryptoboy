//
//  CryptoFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import Foundation

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
    static func updateUnits(_ rawUnits: [MinorUnit], _ idx: Int, _ newValue: String) -> [MinorUnit] {
        // Save old value
        var units = rawUnits
        let oldValue = units[idx].current

        // Replace localized commas with dots
        let input = newValue.replace(target: ",", with: ".").filter { "0123456789.".contains($0) }

        // Max Decimal digits
        if input.count > 39 {
            units[idx].current = oldValue
            return units
        }

        // Don't allow multiple dots
        let dotsCount = input.filter { $0 == "." }.count
        if dotsCount > 1 {
            units[idx].current = oldValue
            return units
        }

        // Allow trailing zeroes
        let oldVal = Decimal(string: units[idx].current)
        let newVal = Decimal(string: input)
        if oldVal == newVal {
            units[idx].current = input
            return units
        }

        // Calculate input value in minor units
        let decimalValue = newVal ?? Decimal.zero
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
