//
//  BitcoinUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct BitcoinUnitView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        Form {
            Section(header: Text("Bitcoin")) {
                TextField("", text: Binding<String>(
                    get: { CryptoFormatter.bitcoin.string(for: state.amount)! },
                    set: {
                        if let value = CryptoFormatter.bitcoin.number(from: $0) {
                            state.amount = value.decimalValue
                        }
                    }
                ))
                .keyboardType(.decimalPad)
            }
            Section(header: Text("mBTC")) {
                TextField("", text: Binding<String>(
                    get: { CryptoFormatter.milliBTC.string(for: state.amount * 1_000)! },
                    set: {
                        if let value = CryptoFormatter.milliBTC.number(from: $0) {
                            state.amount = value.decimalValue / 1_000
                        }
                    }
                ))
                .keyboardType(.decimalPad)
            }
            Section(header: Text("microBTC")) {
                TextField("", text: Binding<String>(
                    get: { CryptoFormatter.microBTC.string(for: state.amount * 1_000_000)! },
                    set: {
                        if let value = CryptoFormatter.microBTC.number(from: $0) {
                            state.amount = value.decimalValue / 1_000_000
                        }
                    }
                ))
                .keyboardType(.decimalPad)
            }
            Section(header: Text("Satoshi")) {
                TextField("", text: Binding<String>(
                    get: { CryptoFormatter.satoshi.string(for: state.amount * 100_000_000)! },
                    set: {
                        if let value = CryptoFormatter.satoshi.number(from: $0) {
                            state.amount = value.decimalValue / 100_000_000
                        }
                    }
                ))
                .keyboardType(.decimalPad)
            }
        }
        .navigationTitle("Bitcoin Unit Converter")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            state.visitView("btc-unit")
        }
        .toolbar {
            NavigationBar("btc-unit")
        }
        .environmentObject(state)
    }
}
