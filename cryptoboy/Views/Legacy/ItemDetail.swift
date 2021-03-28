//
//  ItemDetail.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var state: AppState
    
    let item: MenuItem
    
    var body: some View {
        Text("\(self.item.title) is coming soon!")
            .padding()
            .navigationTitle(self.item.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationBar(self.item.id)
            }
            .onAppear {
                state.visitView(item.id)
            }
            .environmentObject(state)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(AppState())
        }
    }
}
