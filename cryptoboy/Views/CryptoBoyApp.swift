//
//  CryptoboyApp.swift
//  CryptoboyApp
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

@main
struct CryptoBoyApp: App {
    @StateObject var state = AppState()
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(state)
                .environmentObject(order)
        }
    }
}
