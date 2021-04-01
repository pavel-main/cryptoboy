//
//  EthereumUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct EthereumUnitView: View {
    @EnvironmentObject var state: AppState

    static let MAX_FACTOR = 18

    @State var units = [
        MinorUnit.init(title: "Ether", factor: 18, max: MAX_FACTOR),
        MinorUnit.init(title: "milliETH", factor: 15, max: MAX_FACTOR),
        MinorUnit.init(title: "microETH", factor: 12, max: MAX_FACTOR),
        MinorUnit.init(title: "Gwei", factor: 9, max: MAX_FACTOR),
        MinorUnit.init(title: "Mwei", factor: 6, max: MAX_FACTOR),
        MinorUnit.init(title: "Kwei", factor: 3, max: MAX_FACTOR),
        MinorUnit.init(title: "wei", factor: 0, max: MAX_FACTOR)
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
                    .keyboardType(.decimalPad)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .eth_unit))
        .environmentObject(state)
    }
}
