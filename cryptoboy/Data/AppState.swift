//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

class AppState : ObservableObject {
    @Published var hasMessageChanged: Bool = false
    
    @Published var message: String = "" {
        didSet {
            print("Message changed to \(message)")
            
            if (!hasMessageChanged) {
                hasMessageChanged = true
            }
        }
    }
    
    func clear() {
        self.message = ""
        self.hasMessageChanged = false
    }
    
    func getDigest(_ type: String, _ placeholder: String) -> String {
        if (message.isEmpty && !hasMessageChanged) {
            return placeholder
        }
        
        switch type {
        case "sha1":
            return message.sha1()
            
        case "sha256":
            return message.sha256()
        
        case "sha256ripedm160":
            return message.sha256ripemd160()

        case "sha256sha256":
            return message.sha256sha256()
            
        case "sha512":
            return message.sha512()
            
        case "keccak256":
            return message.keccak256()

        case "keccak512":
            return message.keccak512()
            
        case "ripemd160":
            return message.ripemd160()
            
        case "blake256":
            return message.blake256()
        
        case "blake256ripedm160":
            return message.blake256ripemd160()

        case "blake256blake256":
            return message.blake256blake256()
            
        case "groestl512":
            return message.groestl512()
            
        case "groestl512groestl512":
            return message.groestl512groestl512()

        default:
            return "Invalid hash function \(type)"
        }
    }
}
