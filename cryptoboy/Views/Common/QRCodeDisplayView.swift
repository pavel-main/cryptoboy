//
//  QRCodeDisplayView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct QRCodeDisplayView: View {
    @EnvironmentObject var state: AppState

    let title: String
    let data: String

    let QR_SIZE = CGFloat(320)

    var body: some View {
        Form {
            Section(header: Text(self.title)) {
                VStack {
                    Image(uiImage: QRCodeHelper.generate(from: self.data, size: QR_SIZE, level: "M"))
                        .interpolation(.none)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                }
            }

            CopyAlertTextView("Copy to clipboard", { return self.data }, .center)
        }
        .navigationTitle(self.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
