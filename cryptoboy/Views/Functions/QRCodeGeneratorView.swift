//
//  QRCodeView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI
import Combine

struct QRCodeGeneratorView: View {
    @EnvironmentObject var state: AppState

    @State private var level = "M"

    let QR_SIZE = CGFloat(320)

    var body: some View {
        Picker(selection: $level, label: Text("Correction Level")) {
            Text("Low").tag("L")
            Text("Medium").tag("M")
            Text("Quartile").tag("Q")
            Text("High").tag("H")
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())

        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    CopyInputButtonView({ return state.message.value }, { return state.message.isEmpty() })

                    TextField("", text: $state.message.value)
                        .modifier(SimpleKeyboardViewModifier())

                    ClearButtonView({ state.resetMessage() }, { state.message.isEmpty() })
                }
            }

            if !state.message.isEmpty() {
                Section(header: Text("QR Code")) {
                    VStack {
                        Image(uiImage: QRCodeHelper.generate(from: state.message.value, size: QR_SIZE, level: level))
                            .interpolation(.none)
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
            }
        }
        .modifier(NavigationViewModifier(page: .qrcode))
        .environmentObject(state)
    }
}
