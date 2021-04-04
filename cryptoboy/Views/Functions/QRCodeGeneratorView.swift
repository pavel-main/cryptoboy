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

    @State private var data = ""
    @State private var level = "M"
    @State private var revealDetails = false

    let QR_SIZE = CGFloat(320)
    let MESSAGE_LIMIT = 4096

    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "ellipsis.bubble")

                    TextField("", text: $data)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onReceive(data.publisher.collect()) {
                            self.data = String($0.prefix(MESSAGE_LIMIT))
                        }

                    Button(action: {
                        data = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .disabled(data.isEmpty)
                }
                
                DisclosureGroup("Correction Level", isExpanded: $revealDetails) {
                    Picker(selection: $level, label: Text("Correction Level")) {
                        Text("Low").tag("L")
                        Text("Medium").tag("M")
                        Text("Quartile").tag("Q")
                        Text("High").tag("H")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }

            if !data.isEmpty {
                Section(header: Text("QR Code")) {
                    VStack {
                        Image(uiImage: QRCodeHelper.generate(from: self.data, size: QR_SIZE, level: self.level))
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
