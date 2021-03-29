//
//  SettingsDonateItem.swift
//  cryptoboy
//
//  Created by Pavel on 29/03/2021.
//

import SwiftUI

struct SettingsDonateItem: View {
    var type: String
    var address: String
    @State private var showCopyAlert = false
    
    init(_ type: String, _ address: String) {
        self.type = type
        self.address = address
    }
    
    var body: some View {
        HStack {
            Text(type)
            Spacer()
            Button(action: {
                UIPasteboard.general.string = address
                showCopyAlert.toggle()
            }) {
                Text(address)
                    .frame(height: 10)
                    .multilineTextAlignment(.trailing)
            }
        }
        .alert(isPresented: $showCopyAlert) {
            Alert(
                title: Text("Copied to clipboard"),
                message: Text("\(type) address: \(address)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct SettingsDonateItem_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDonateItem("BTC", "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
    }
}
