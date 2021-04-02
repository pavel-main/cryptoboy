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
        BaseUnit.init(title: "Decimal", base: 10, current: "0", whitelist: "0123456789"),
        BaseUnit.init(title: "Octal", base: 8, current: "0", whitelist: "01234567"),
        BaseUnit.init(title: "Hexadecimal", base: 16, current: "0", whitelist: "0123456789ABCDEF"),
        BaseUnit.init(title: "Binary", base: 2, current: "0", whitelist: "01")
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
                            let updated = CryptoUnitFormatter.updateBaseUnits(self.units, idx, newValue)
                            self.units = updated
                        })
                    )
                    .keyboardType(.namePhonePad)
                }
            }
        }
        .modifier(NavigationViewModifier(page: .base))
        .environmentObject(state)
    }
}
