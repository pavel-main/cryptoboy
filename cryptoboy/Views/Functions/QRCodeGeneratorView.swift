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
                }
            }
            
            Section(header: Text("Correction Level")) {
                Picker(selection: $level, label: Text("Correction Level")) {
                    Text("Low").tag("L")
                    Text("Medium").tag("M")
                    Text("Quartile").tag("Q")
                    Text("High").tag("H")
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            if !data.isEmpty {
                Section(header: Text("QR Code")) {
                    Image(uiImage: QRCodeHelper.generate(from: self.data, size: QR_SIZE, level: self.level))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: QR_SIZE, height: QR_SIZE)
                }
            }

        }
        .modifier(NavigationViewModifier(page: .qrcode))
        .environmentObject(state)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGeneratorView()
            .environmentObject(AppState())
    }
}
