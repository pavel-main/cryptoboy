//
//  HashingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct HashingItemView: View {
    @EnvironmentObject var state: AppState
    @State private var showCopyAlert = false

    var type: String
    var title: String
    
    init(_ type: String, _ title: String) {
        self.type = type
        self.title = title
    }
    
    var body: some View {
        if (!state.isDefault()) {
            Section(header: Text(self.title)) {
                HStack {
                    Button(action: {
                        UIPasteboard.general.string = state.getHashOrDefault(type, title)
                        showCopyAlert.toggle()
                    }) {
                        Text(state.getHashOrDefault(type, title))
                    }
                }
            }
            .alert(isPresented: $showCopyAlert) {
                Alert(
                    title: Text("Copied to clipboard"),
                    message: Text("\(title) hash was copied to clipboard!"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .environmentObject(state)
        }
    }
}

struct HashFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        HashingItemView("sha256", "SHA-256")
    }
}
