//
//  HashingItemView.swift
//  cryptoboy
//
//  Created by Pavel on 28/03/2021.
//

import SwiftUI

struct HashingItemView: View {
    @EnvironmentObject var state: AppState
    
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
                    }) {
                        Text(state.getHashOrDefault(type, title))
                    }
                }
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
