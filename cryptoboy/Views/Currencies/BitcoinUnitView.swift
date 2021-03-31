//
//  BitcoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI
import BigNumber

struct BitcoinUnitView: View {
    @EnvironmentObject var state: AppState
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        return formatter
    }
    
    private func convertFrom(_ input: String, _ multiplier: Int) -> String {
        let sanitized = input
            .replacingOccurrences(of: ",", with: ".")
            .replacingOccurrences(of: ".", with: ".0")
        print("ConvertFrom input: \(sanitized) multiplier: \(multiplier)")
        let decimal = formatter.number(from: sanitized)?.decimalValue ?? Decimal.zero
        
        print("ConvertFrom input: \(sanitized) multiplier: \(multiplier) decimal: \(decimal)")
        let result = decimal * Decimal.init(multiplier)
        return String(describing: result)
    }
    
    private func convertTo(_ input: String, _ divider: Int) -> String {
        let sanitized = input
            .replacingOccurrences(of: ",", with: ".")
            .replacingOccurrences(of: ".", with: ".0")
        print("ConvertFrom input: \(sanitized) divider: \(divider)")
        let decimal = formatter.number(from: sanitized)?.decimalValue ?? Decimal.zero
        
        print("ConvertTo input: \(sanitized) divider: \(divider) decimal: \(decimal)")
        let result = decimal / Decimal.init(divider)
        return String(describing: result)
    }
    
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
                            let sanitized = BDouble(newValue)
                            let decimal = BDouble(newValue) ?? BDouble(0)
                            let minor = decimal * self.units[idx].power
                            print("Decimal: \(decimal) minor: \(minor) newValue: \(sanitized)")
                            
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
            
//            Section(header: Text("Bitcoin")) {
//                TextField("Bitcoin", text: $text.amount)
//                    .keyboardType(.decimalPad)
//            }
//            Section(header: Text("mBTC")) {
//                TextField("mBTC", text: Binding<String>(
//                    get: { convertFrom(state.amount, 1_000) },
//                    set: { state.amount = convertTo($0, 1_000) }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("microBTC")) {
//                TextField("microBTC", text: Binding<String>(
//                    get: { convertFrom(state.amount, 1_000_000) },
//                    set: { state.amount = convertTo($0, 1_000_000) }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("Satoshi")) {
//                TextField("Satoshii", text: Binding<String>(
//                    get: { convertFrom(state.amount, 100_000_000) },
//                    set: { state.amount = convertTo($0, 100_000_000) }
//                ))
//                .keyboardType(.decimalPad)
//            }
        }
        .modifier(NavigationViewModifier(page: .btc_unit))
        .environmentObject(state)
    }
}
