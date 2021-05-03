//
//  BitcoinTransactionSizeView.swift
//  cryptoboy
//
//  Created by Pavel on 03/05/2021.
//

import Foundation
import SwiftUI

struct BitcoinTransactionSizeView: View {
    @EnvironmentObject var state: AppState
    
    @State private var txType: BitcoinTxType = .p2pkh
    @State private var inputs: Double = 1.0
    @State private var outputs: Double = 1.0
    
    @State private var totalOverheadSize: Double? = nil
    @State private var totalInputSize: Double? = nil
    @State private var totalOutputSize: Double? = nil
    @State private var totalTxSize: Double? = nil
    
    private var inputSizes: [BitcoinTxType: Double] = [
        .p2pkh: 148,
        .p2wpkh: 67.75,
        .p2sh: 297,
        .p2wsh: 104.25,
        .p2tr: 57.25
    ]
    
    private var outputSizes: [BitcoinTxType: Double] = [
        .p2pkh: 34,
        .p2wpkh: 31,
        .p2sh: 32,
        .p2wsh: 43,
        .p2tr: 43
    ]
    
    private var isSegwit: [BitcoinTxType: Bool] = [
        .p2pkh: false,
        .p2wpkh: true,
        .p2sh: false,
        .p2wsh: true,
        .p2tr: true
    ]
    
    var body: some View {
        Picker(selection: $txType, label: Text("Transaction Type")) {
            Text("P2PKH").tag(BitcoinTxType.p2pkh)
            Text("P2WPKH").tag(BitcoinTxType.p2wpkh)
            Text("P2SH").tag(BitcoinTxType.p2sh)
            Text("P2WSH").tag(BitcoinTxType.p2wsh)
            Text("P2TR").tag(BitcoinTxType.p2tr)
        }
        .onChange(of: txType) { _ in
            calculate()
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())
        
        Form {
            Section(header: Text("Inputs \(Int(inputs))")) {
                Slider(value: Binding<Double>(
                    get: {
                        return inputs
                    },
                    set: { newValue in
                        let oldValue = Int(inputs)
                        inputs = newValue

                        if oldValue != Int(newValue) {
                            calculate()
                        }
                    }
                ), in: 1...10, step: 1)
            }
            
            Section(header: Text("Outputs \(Int(outputs))")) {
                Slider(value: Binding<Double>(
                    get: {
                        return outputs
                    },
                    set: { newValue in
                        let oldValue = Int(outputs)
                        outputs = newValue

                        if oldValue != Int(newValue) {
                            calculate()
                        }
                    }
                ), in: 1...10, step: 1)
            }
            
            if (totalTxSize != nil) {
                CopyAlertTextView("Overhead Size", { return totalOverheadSize!.description })
                CopyAlertTextView("Total Input Size", { return totalInputSize!.description })
                CopyAlertTextView("Total Output Size", { return totalOutputSize!.description })
                CopyAlertTextView("Total Size", { return totalTxSize!.description })
            }
        }
        .modifier(NavigationViewModifier(page: .btc_tx_size))
        .environmentObject(state)
    }
    
    func calculate() {
        let inputSize = inputSizes[txType]!
        let outputSize = outputSizes[txType]!
        let segwit = isSegwit[txType]!
        
        var witness_flag: Double = 0
        if (segwit) {
            witness_flag = 0.5 + 0.25
        }
        
        totalOverheadSize = 10 + witness_flag
        totalInputSize = inputSize * inputs
        totalOutputSize = outputSize * outputs
        totalTxSize = totalOverheadSize! + totalInputSize! + totalOutputSize!
    }
}
