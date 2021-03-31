//
//  EthereumUnitView.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct EthereumUnitView: View {
    @EnvironmentObject var state: AppState
    
    var body: some View {
        Form {
//            Section(header: Text("Ether")) {
//                TextField("", text: $state.amount)
//                    .keyboardType(.decimalPad)
//            }
//            Section(header: Text("milliether (szabo)")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.milliether.string(for: state.amount * 1_000)! },
//                    set: {
//                        if let value = CryptoFormatter.milliether.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("microether (finney)")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.microether.string(for: state.amount * 1_000_000)! },
//                    set: {
//                        if let value = CryptoFormatter.microether.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("Gwei (shannon)")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.gwei.string(for: state.amount * 1_000_000_000)! },
//                    set: {
//                        if let value = CryptoFormatter.gwei.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000_000_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("Mwei (lovelace)")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.mwei.string(for: state.amount * 1_000_000_000_000)! },
//                    set: {
//                        if let value = CryptoFormatter.mwei.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000_000_000_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("Kwei (babbage)")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.kwei.string(for: state.amount * 1_000_000_000_000_000)! },
//                    set: {
//                        if let value = CryptoFormatter.kwei.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000_000_000_000_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
//            Section(header: Text("wei")) {
//                TextField("", text: Binding<String>(
//                    get: { CryptoFormatter.wei.string(for: state.amount * 1_000_000_000_000_000_000)! },
//                    set: {
//                        if let value = CryptoFormatter.wei.number(from: $0) {
//                            state.amount = value.decimalValue / 1_000_000_000_000_000_000
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
//            }
        }
        .modifier(NavigationViewModifier(page: .eth_unit))
        .environmentObject(state)
    }
}

