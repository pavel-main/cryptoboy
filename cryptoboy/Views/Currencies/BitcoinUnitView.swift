//
//  BitcoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct BitcoinUnitView: View {
    @EnvironmentObject var state: AppState

    static let MAX_FACTOR = 8

    @State var units = [
        MinorUnit.init(title: "Bitcoin", factor: 8, max: MAX_FACTOR),
        MinorUnit.init(title: "milliBTC", factor: 5, max: MAX_FACTOR),
        MinorUnit.init(title: "microBTC", factor: 2, max: MAX_FACTOR),
        MinorUnit.init(title: "Satoshi", factor: 0, max: MAX_FACTOR)
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
                            let updated = CryptoUnitFormatter.updateUnits(self.units, idx, newValue)
                            self.units = updated
                        })
                    )
                    //.keyboardType(.decimalPad)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .btc_unit))
        .environmentObject(state)
    }
}
