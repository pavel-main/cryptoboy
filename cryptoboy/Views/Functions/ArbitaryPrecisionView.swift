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
    @State private var showCopyAlert = false

    private var operations: [BigOperation] = [.plus, .minus, .mul, .div]

    @State var op1: String = "0"
    @State var op2: String = "0"
    @State var operation: BigOperation = .plus
    @State var result: String = ""

    var body: some View {
        Form {
            Section(header: Text("Operand 1")) {
                TextField("", text: Binding(
                    get: {
                        return op1
                    },
                    set: { (newValue) in
                        let oldValue = self.op1
                        self.op1 = self.validate(oldValue, newValue)
                        self.calculate()
                    })
                )
                .keyboardType(.namePhonePad)
            }

            Section(header: Text("Operation")) {
                Picker(selection: $operation, label: Text("Operation")) {
                    ForEach(self.operations) {
                        Text($0.title).tag($0)
                    }
                }
                .onChange(of: operation, perform: { _ in
                    self.calculate()
                })
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Operand 2")) {
                TextField("", text: Binding(
                    get: {
                        return op2
                    },
                    set: { (newValue) in
                        let oldValue = self.op2
                        self.op2 = self.validate(oldValue, newValue)
                        self.calculate()
                    })
                )
                .keyboardType(.namePhonePad)
            }

            if !self.result.isEmpty {
                Section(header: Text("Result")) {
                    HStack {
                        Button(action: {
                            UIPasteboard.general.string = self.result
                            showCopyAlert.toggle()
                        }) {
                            Text(self.result)
                        }
                    }
                }
                .alert(isPresented: $showCopyAlert) {
                    Alert(
                        title: Text("Copied to clipboard"),
                        message: Text(self.result),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .environmentObject(state)
            }
        }
        .modifier(NavigationViewModifier(page: .uint256))
        .environmentObject(state)
    }

    func validate(_ oldValue: String, _ newValue: String) -> String {
        var input = "0"
        if !newValue.isEmpty {
            input = newValue.uppercased().filter { "0123456789ABCDEF".contains($0) }
        }

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
