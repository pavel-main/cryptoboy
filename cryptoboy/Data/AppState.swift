//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

class AppState : ObservableObject {
    @Published var hashMessageChanged: Bool = false
    
    @Published var hashMessage: String = "" {
        didSet {
            print("Hash message changed to \(hashMessage)")
            
            if (!hashMessageChanged) {
                hashMessageChanged = true
            }
        }
    }
    
    func clear() {
        self.hashMessage = ""
        self.hashMessageChanged = false
    }
}
