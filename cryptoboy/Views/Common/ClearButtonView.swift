//
//  ClearButtonView.swift
//  cryptoboy
//
//  Created by Pavel on 11/04/2021.
//

import Foundation
import SwiftUI

struct ClearButtonView: View {
    @EnvironmentObject var state: AppState

    var callback: () -> Void
    var disabled: () -> Bool

    init(_ callback: @escaping () -> Void, _ disabled: @escaping () -> Bool) {
        self.callback = callback
        self.disabled = disabled
    }

    var body: some View {
        Button(action: self.callback) {
            Image(systemName: "xmark.circle.fill")
        }
        .buttonStyle(BorderlessButtonStyle())
        .disabled(self.disabled())
        .environmentObject(state)
    }
}
