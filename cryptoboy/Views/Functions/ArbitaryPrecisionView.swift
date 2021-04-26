//
//  ArbitaryPrecisionView.swift
//  cryptoboy
//
//  Created by Pavel on 02/04/2021.
//

import Foundation
import SwiftUI
import BigInt

struct ArbitaryPrecisionView: View {
    @EnvironmentObject var state: AppState

    private var operations: [BigOperation] = [.plus, .minus, .mul, .div]

    @State var op1: String = "0"
    @State var op2: String = "0"
    @State var operation: BigOperation = .plus
    @State var result: String = ""

    var body: some View {
        Picker(selection: $operation, label: Text("Operation")) {
            ForEach(self.operations) {
                Image(systemName: $0.title).tag($0)
            }
        }
        .onChange(of: operation, perform: { _ in
            self.calculate()
        })
        .pickerStyle(SegmentedPickerStyle())
        .padding()

        Form {
            Section(header: Text("Operand 1")) {
                HStack {
                    CopyInputButtonView({ return self.op1 }, { return self.op1.isEmpty })

                    TextField("", text: Binding(
                        get: {
                            return self.op1
                        },
                        set: { (newValue) in
                            let oldValue = self.op1
                            self.op1 = self.validate(oldValue, newValue)
                            self.calculate()
                        })
                    )
                    .modifier(HexKeyboardViewModifier(hex: true))
                }
            }

            Section(header: Text("Operand 2")) {
                HStack {
                    CopyInputButtonView({ return self.op2 }, { return self.op2.isEmpty })

                    TextField("", text: Binding(
                        get: {
                            return self.op2
                        },
                        set: { (newValue) in
                            let oldValue = self.op2
                            self.op2 = self.validate(oldValue, newValue)
                            self.calculate()
                        })
                    )
                    .modifier(HexKeyboardViewModifier(hex: true))
                }
            }

            if !self.result.isEmpty {
                CopyAlertTextView("Result", { return self.result })
            }
        }
        .modifier(NavigationViewModifier(page: .uint256))
        .environmentObject(state)
    }

    func validate(_ oldValue: String, _ newValue: String) -> String {
        let input = newValue.lowercased().filter { "0123456789abcdef".contains($0) }

        guard let value = BInt(input, radix: 16) else {
            return oldValue
        }

        return value.asString(radix: 16)
    }

    func calculate() {
        guard let big1 = BInt(self.op1, radix: 16) else {
            result = ""
            return
        }
        guard let big2 = BInt(self.op2, radix: 16) else {
            result = ""
            return
        }

        var calc: BInt?

        switch self.operation {
        case .plus:
            calc = big1 + big2
        case .minus:
            calc = big1 - big2
        case .mul:
            calc = big1 * big2
        case .div:
            if big2 != 0 {
                calc = big1 / big2
            }
        }

        guard let calcResult = calc else {
            result = ""
            return
        }

        self.result = calcResult.asString(radix: 16, uppercase: false)
    }
}
