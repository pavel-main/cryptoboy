//
//  ItemDetail.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct ComingSoonView: View {
    @EnvironmentObject var state: AppState

    let item: MenuItem

    var body: some View {
        Text("\(self.item.title) is coming soon!")
            .padding()
            .modifier(NavigationViewModifier(page: .unknown))
            .environmentObject(state)
    }
}
