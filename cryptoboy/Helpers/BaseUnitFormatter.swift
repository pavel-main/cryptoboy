//
//  BaseUnitFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import SwiftRadix

class BaseUnitFormatter {
    /**
     * Updates all units with `newValue` passed at `idx`
     */
    static func updateUnits(_ rawUnits: [BaseUnit], _ idx: Int, _ newValue: String) -> [BaseUnit] {
        // Save old value
        var units = rawUnits

        // Default fallback value
        var input = "0"
        if !newValue.isEmpty {
            // Validate input
            input = newValue.uppercased().filter { units[idx].whitelist.contains($0) }
        }

        // Convert to radix value with current base
        let radix = input.radix(base: units[idx].base, as: UInt64.self) ?? UInt64.max.binary

        // Calculate all values based on input
        for (jdx, item) in units.enumerated() {
            units[jdx].current = radix.value.radix(base: item.base).stringValue
        }

        return units
    }
}
