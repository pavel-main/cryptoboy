//
//  BaseConverterView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import SwiftUI

struct BaseConverterView: View {
    @EnvironmentObject var state: AppState

    @State var units = [
        BaseUnit.init(title: "Decimal", base: 10, current: "0", whitelist: "0123456789", keyboard: .asciiCapableNumberPad),
        BaseUnit.init(title: "Octal", base: 8, current: "0", whitelist: "01234567", keyboard: .asciiCapableNumberPad),
        BaseUnit.init(title: "Hexadecimal", base: 16, current: "0", whitelist: "0123456789ABCDEF", keyboard: .namePhonePad),
        BaseUnit.init(title: "Binary", base: 2, current: "0", whitelist: "01", keyboard: .asciiCapableNumberPad)
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
                            let updated = BaseUnitFormatter.updateUnits(self.units, idx, newValue)
                            self.units = updated
                        })
                    )
                    .keyboardType(self.units[idx].keyboard)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .base))
        .environmentObject(state)
    }
}
