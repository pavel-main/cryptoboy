//
//  PolkadotUnitConverter.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.
//

import SwiftUI

struct PolkadotUnitView: View {
    @EnvironmentObject var state: AppState

    @State private var isKusama = false

    static let MAX_FACTOR_DOT = 10
    static let MAX_FACTOR_KSM = 12

    @State var dotUnits = [
        MinorUnit.init(title: "DOT", factor: 10, max: MAX_FACTOR_DOT),
        MinorUnit.init(title: "Millidot", factor: 7, max: MAX_FACTOR_DOT),
        MinorUnit.init(title: "MicroDOT", factor: 4, max: MAX_FACTOR_DOT),
        MinorUnit.init(title: "Planck", factor: 0, max: MAX_FACTOR_DOT)
    ]

    @State var ksmUnits = [
        MinorUnit.init(title: "KSM", factor: 12, max: MAX_FACTOR_KSM),
        MinorUnit.init(title: "MilliKSM", factor: 9, max: MAX_FACTOR_KSM),
        MinorUnit.init(title: "MicroKSM", factor: 6, max: MAX_FACTOR_KSM),
        MinorUnit.init(title: "Point", factor: 3, max: MAX_FACTOR_KSM),
        MinorUnit.init(title: "Planck", factor: 0, max: MAX_FACTOR_KSM)
    ]

    var body: some View {
        Picker(selection: $isKusama, label: Text("Token")) {
            Text("Polkadot").tag(false)
            Text("Kusama").tag(true)
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())

        Form {
            if !isKusama {
                ForEach(dotUnits.indices, id: \.self) { idx in
                    Section(header: Text(self.dotUnits[idx].title)) {
                        HStack {
                            CopyInputButtonView({ return self.dotUnits[idx].current })

                            TextField("", text: Binding(
                                get: {
                                    return self.dotUnits[idx].current
                                },
                                set: { (newValue) in
                                    let updated = CryptoUnitFormatter.updateUnits(self.dotUnits, idx, newValue)
                                    self.dotUnits = updated
                                })
                            )
                            .keyboardType(.decimalPad)
                            .modifier(SimpleKeyboardViewModifier())
                        }
                    }
                }
            } else {
                ForEach(ksmUnits.indices, id: \.self) { idx in
                    Section(header: Text(self.ksmUnits[idx].title)) {
                        HStack {
                            CopyInputButtonView({ return self.ksmUnits[idx].current })

                            TextField("", text: Binding(
                                get: {
                                    return self.ksmUnits[idx].current
                                },
                                set: { (newValue) in
                                    let updated = CryptoUnitFormatter.updateUnits(self.ksmUnits, idx, newValue)
                                    self.ksmUnits = updated
                                })
                            )
                            .keyboardType(.decimalPad)
                            .modifier(SimpleKeyboardViewModifier())
                        }
                    }
                }
            }

        }
        .modifier(NavigationViewModifier(page: .dot_unit))
        .environmentObject(state)
    }
}
