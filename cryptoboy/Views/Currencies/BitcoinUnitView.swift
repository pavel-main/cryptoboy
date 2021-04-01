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
        MinorUnit(name: "Bitcoin", power: 100_000_000, value: "1", fmt: CryptoUnitFormatter.bitcoin),
        MinorUnit(name: "milliBTC", power: 100_000, value: "1000", fmt: CryptoUnitFormatter.milliBTC),
        MinorUnit(name: "microBTC", power: 100, value: "1000000", fmt: CryptoUnitFormatter.microBTC),
        MinorUnit(name: "Satoshi", power: 1, value: "100000000", fmt: CryptoUnitFormatter.satoshi),
    ]
    
    var body: some View {
        Form {
            ForEach(units.indices, id: \.self) { idx in
                Section(header: Text(self.units[idx].name)) {
                    TextField("", text: Binding(
                        get: {
                            return self.units[idx].value
                        },
                        set: { (newValue) in
                            // Save old value
                            let oldValue = self.units[idx].value
                            
                            // Replace localized commas with dots
                            let filteredInput = newValue.replace(target: ",", with: ".").filter { "0123456789.".contains($0) }
    
                            // Don't allow multiple dots
                            let dotsCount = filteredInput.filter { $0 == "." }.count
                            if (dotsCount > 1) {
                                self.units[idx].value = oldValue
                                return
                            }
                            
                            // Allow trailing zeroes
                            let oldVal = Decimal(string: self.units[idx].value)
                            let newVal = Decimal(string: filteredInput)
                            if (oldVal == newVal) {
                                self.units[idx].value = filteredInput
                                return
                            }
                            
                            // Calculate input value in minor units
                            let decimalValue = Decimal(string: filteredInput) ?? Decimal.zero
                            let minorValue = decimalValue * self.units[idx].power
                            
                            // Calculate all values based on input
                            for (jdx, item) in units.enumerated() {
                                let unitValue = minorValue / item.power
                                let result = item.fmt.string(for: unitValue) ?? "0"
                                self.units[jdx].value = result
                            }
                        })
                    )
                    .keyboardType(.decimalPad)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .btc_unit))
        .environmentObject(state)
    }
}
