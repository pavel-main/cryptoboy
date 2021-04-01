//
//  QRCodeDisplayView.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct QRCodeDisplayView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false
    
    let title: String
    let data: String

    let QR_SIZE = CGFloat(320)

    var body: some View {
        Form {
            Section(header: Text(self.title)) {
                Image(uiImage: QRCodeHelper.generate(from: self.data, size: QR_SIZE, level: "M"))
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: QR_SIZE, height: QR_SIZE)
            }
            
            Section(header: Text("Copy to clibboard")) {
                Button(action: {
                    UIPasteboard.general.string = self.data
                    showCopyAlert.toggle()
                }) {
                    Text(self.data)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .alert(isPresented: $showCopyAlert) {
            Alert(
                title: Text("Copied to clipboard"),
                message: Text("\(self.data)"),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle(self.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct QRCodeDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeDisplayView(title: "Donate BTC", data: "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
    }
}
