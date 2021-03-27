//
//  CryptoboyApp.swift
//  CryptoboyApp
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

@main
struct CryptoBoyApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            HashView().environmentObject(order)
        }
    }
}
