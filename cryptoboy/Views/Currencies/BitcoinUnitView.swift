//
//  BitcoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct BitcoinUnitView: View {
    @EnvironmentObject var state: AppState
    
    @State var units = [
        MinorUnit(title: "Bitcoin", multiplier: 100_000_000, current: "1", formatter: CryptoUnitFormatter.bitcoin),
        MinorUnit(title: "milliBTC", multiplier: 100_000, current: "1000", formatter: CryptoUnitFormatter.milliBTC),
        MinorUnit(title: "microBTC", multiplier: 100, current: "1000000", formatter: CryptoUnitFormatter.microBTC),
        MinorUnit(title: "Satoshi", multiplier: 1, current: "100000000", formatter: CryptoUnitFormatter.satoshi),
    ]
    
    var body: some View {
        Form {
            ForEach(units.indices, id: \.self) { idx in
                Section(header: Text(self.units[idx].title)) {
                    TextField("", text: Binding(
                        get: {
                            return self.units[idx].current
                        },
                        set: { (newValue) in
                            return setValue(idx, newValue)
                        })
                    )
                    .keyboardType(.decimalPad)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .btc_unit))
        .environmentObject(state)
    }
    
    func setValue(_ idx: Int, _ newValue: String) {
        // Save old value
        let oldValue = self.units[idx].current
        
        // Replace localized commas with dots
        let filteredInput = newValue.replace(target: ",", with: ".").filter { "0123456789.".contains($0) }

        // Don't allow multiple dots
        let dotsCount = filteredInput.filter { $0 == "." }.count
        if (dotsCount > 1) {
            self.units[idx].current = oldValue
            return
        }
        
        // Allow trailing zeroes
        let oldVal = Decimal(string: self.units[idx].current)
        let newVal = Decimal(string: filteredInput)
        if (oldVal == newVal) {
            self.units[idx].current = filteredInput
            return
        }
        
        // Calculate input value in minor units
        let decimalValue = Decimal(string: filteredInput) ?? Decimal.zero
        let minorValue = decimalValue * self.units[idx].multiplier
        
        // Calculate all values based on input
        for (jdx, item) in units.enumerated() {
            let unitValue = minorValue / item.multiplier
            let result = item.formatter.string(for: unitValue) ?? "0"
            self.units[jdx].current = result
        }
    }
}
