//
//  BitcoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct BitcoinUnitView: View {
    @EnvironmentObject var state: AppState
    
    struct MinorUnit {
        var name: String
        var power: Decimal
        var value: String
    }
    
    @State var units = [
        MinorUnit(name: "Bitcoin", power: 100_000_000, value: "1"),
        MinorUnit(name: "milliBTC", power: 100_000, value: "1000"),
        MinorUnit(name: "microBTC", power: 100, value: "1000000"),
        MinorUnit(name: "Satoshi", power: 1, value: "100000000"),
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
                            let input = newValue.replacingOccurrences(of: ",", with: ".")
                            
                            let oldVal = Decimal(string: self.units[idx].value)
                            let newVal = Decimal(string: input)
                            
                            if (oldVal == newVal) {
                                self.units[idx].value = input
                                return
                            }
                            
                            let decimal = Decimal(string: input) ?? Decimal.zero
                            let minor = decimal * self.units[idx].power
                            print("Decimal: \(decimal) minor: \(minor)")
                            
                            for (jdx, item) in units.enumerated() {
                                let result = minor / item.power
                                print("Result: \(result) name: \(item.name)")
                                self.units[jdx].value = String(describing: result)
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
