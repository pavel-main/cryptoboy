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

    @State var op1: BInt = BInt(0) {
        didSet {
            self.calculate()
        }
    }

    @State var op2: BInt = BInt(0) {
        didSet {
            self.calculate()
        }
    }

    @State var operation: BigOperation = .plus

    @State var result: BInt?

    var body: some View {
        Form {
            Section(header: Text("Operand 1")) {
                TextField("", text: Binding(
                    get: {
                        return op1.asString(radix: 16)
                    },
                    set: { (newValue) in
                        let oldValue = self.op1
                        let raw = newValue.uppercased().filter { "0123456789ABCDEF".contains($0) }

                        if raw.isEmpty {
                            self.op1 = BInt(0)
                            return
                        }

                        guard let value = BInt(raw, radix: 16) else {
                            self.op1 = oldValue
                            return
                        }

                        self.op1 = value
                    })
                )
                .keyboardType(.namePhonePad)
            }

            Section(header: Text("Operator")) {
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
                        return op2.asString(radix: 16)
                    },
                    set: { (newValue) in
                        let oldValue = self.op2
                        let raw = newValue.uppercased().filter { "0123456789ABCDEF".contains($0) }

                        if raw.isEmpty {
                            self.op2 = BInt(0)
                            return
                        }

                        guard let value = BInt(raw, radix: 16) else {
                            self.op2 = oldValue
                            return
                        }

                        self.op2 = value
                    })
                )
                .keyboardType(.namePhonePad)
            }

            if self.result != nil {
                Section(header: Text("Result")) {
                    HStack {
                        Button(action: {
                            UIPasteboard.general.string = self.export()
                            showCopyAlert.toggle()
                        }) {
                            Text(self.export())
                        }
                    }
                }
                .alert(isPresented: $showCopyAlert) {
                    Alert(
                        title: Text("Copied to clipboard"),
                        message: Text(self.export()),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .environmentObject(state)
            }
        }
        .modifier(NavigationViewModifier(page: .uint256))
        .environmentObject(state)
    }

    func calculate() {
        switch self.operation {
        case .plus:
            self.result = self.op1 + self.op2
        case .minus:
            self.result = self.op1 - self.op2
        case .mul:
            self.result = self.op1 * self.op2
        case .div:
            if self.op2 != 0 {
                self.result = self.op1 / self.op2
            }
        }
    }

    func export() -> String {
        guard let number = result?.asString(radix: 16, uppercase: false) else {
            return ""
        }

        return number
    }
}
