//
//  ShamirSecretView.swift
//  cryptoboy
//
//  Created by Pavel on 10/04/2021.
//

import SwiftUI
import SwiftySSS

struct ShamirSecretView: View {
    @EnvironmentObject var state: AppState

    @State private var shares: Double = 5.0
    @State private var threshold: Double = 3.0

    @State private var secret: Secret?
    @State private var secretShares: [Secret.Share] = []

    var body: some View {
        Form {
            Section(header: Text("Input")) {
                HStack {
                    CopyInputButtonView({ return state.message.value }, { return state.message.isDefault() })

                    TextField("", text: $state.message.value)
                        .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.resetMessage() }, { state.message.isDefault() })
                        .onChange(of: state.message.value, perform: { _ in
                            self.calculate()
                        })
                }
            }

            Section(header: Text("Shares (\(Int(shares)))")) {
                Slider(value: Binding<Double>(
                    get: {
                        return self.shares
                    },
                    set: { newValue in
                        let oldValue = Int(self.shares)
                        self.shares = newValue

                        if Int(self.threshold) > Int(newValue) {
                            self.threshold = newValue
                        }

                        if oldValue != Int(newValue) {
                            self.calculate()
                        }
                    }
                ), in: 2...10, step: 1)
            }

            if self.shares != 2 {
                Section(header: Text("Threshold (\(Int(threshold)))")) {
                    Slider(value: Binding<Double>(
                        get: {
                            return self.threshold
                        },
                        set: { newValue in
                            let oldValue = Int(self.threshold)
                            self.threshold = newValue

                            if oldValue != Int(newValue) {
                                self.calculate()
                            }
                        }
                    ), in: 2...shares, step: 1)
                }
            }

            if secret != nil && !state.message.isEmpty() {
                ForEach((1...Int(self.shares)), id: \.self) { idx in
                    CopyAlertTextView("Share \(idx)", {
                        return self.getShare(idx)
                    })
                }
            }
        }
        .onAppear {
            self.calculate()
        }
        .modifier(NavigationViewModifier(page: .shamir))
    }

    func calculate() {
        if state.message.isEmpty() {
            return
        }

        let message = Data([UInt8](state.message.value.utf8))
        do {
            try self.secret = Secret(data: message, threshold: Int(self.threshold), shares: Int(self.shares))
            try self.secretShares = self.secret!.split()
        } catch {
            print("Error creating secret")
        }
    }

    func getShare(_ index: Int) -> String {
        return self.secretShares[index-1].description
    }
}
