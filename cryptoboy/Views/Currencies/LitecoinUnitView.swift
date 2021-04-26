//
//  LitecoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct LitecoinUnitView: View {
    @EnvironmentObject var state: AppState

    static let MAX_FACTOR = 8

    @State var units = [
        MinorUnit.init(title: "LTC", factor: 8, max: MAX_FACTOR),
        MinorUnit.init(title: "Lite / Millilitecoin", factor: 5, max: MAX_FACTOR),
        MinorUnit.init(title: "Photon / Litoshi", factor: 0, max: MAX_FACTOR)
    ]

    var body: some View {
        Form {
            ForEach(units.indices, id: \.self) { idx in
                Section(header: Text(self.units[idx].title)) {
                    HStack {
                        CopyInputButtonView({ return self.units[idx].current })

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
                        .modifier(DefaultKeyboardViewModifier())
                    }
                }
            }
        }
        .modifier(NavigationViewModifier(page: .ltc_unit))
        .environmentObject(state)
    }
}
