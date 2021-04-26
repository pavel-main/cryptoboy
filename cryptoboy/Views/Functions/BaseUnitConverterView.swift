//
//  BaseConverterView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import SwiftUI

struct BaseUnitConverterView: View {
    @EnvironmentObject var state: AppState

    @State var units = [
        BaseUnit.init(title: "Decimal", base: 10, current: "0", whitelist: "0123456789", isHex: false),
        BaseUnit.init(title: "Octal", base: 8, current: "0", whitelist: "01234567", isHex: false),
        BaseUnit.init(title: "Hexadecimal", base: 16, current: "0", whitelist: "0123456789ABCDEF", isHex: true),
        BaseUnit.init(title: "Binary", base: 2, current: "0", whitelist: "01", isHex: false)
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
                                let updated = BaseUnitFormatter.updateUnits(self.units, idx, newValue)
                                self.units = updated
                            })
                        )
                        .modifier(HexKeyboardViewModifier(hex: self.units[idx].isHex))
                    }
                }
            }
        }
        .modifier(NavigationViewModifier(page: .base))
        .environmentObject(state)
    }
}
