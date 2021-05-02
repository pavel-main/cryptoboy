//
//  BaseUnitFormatter.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import BigInt

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
        guard let value = BInt(input, radix: units[idx].base) else {
            return rawUnits
        }

        // Calculate all values based on input
        for (jdx, _) in units.enumerated() {
            units[jdx].current = value.asString(radix: units[jdx].base)
        }

        return units
    }
}
