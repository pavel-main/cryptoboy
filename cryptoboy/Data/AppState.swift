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
    
    func getDigest(_ type: String, _ placeholder: String) -> String {
        if (hashMessage.isEmpty && !hashMessageChanged) {
            return placeholder
        }
        
        switch type {
        case "sha1":
            return hashMessage.sha1()
            
        case "sha256":
            return hashMessage.sha256()
        
        case "sha256ripedm160":
            return hashMessage.sha256ripemd160()

        case "sha256sha256":
            return hashMessage.sha256sha256()
            
        case "sha512":
            return hashMessage.sha512()
            
        case "keccak256":
            return hashMessage.keccak256()

        case "keccak512":
            return hashMessage.keccak512()
            
        case "ripemd160":
            return hashMessage.ripemd160()
            
        case "blake256":
            return hashMessage.blake256()
        
        case "blake256ripedm160":
            return hashMessage.blake256ripemd160()

        case "blake256blake256":
            return hashMessage.blake256blake256()
            
        case "groestl512":
            return hashMessage.groestl512()
            
        case "groestl512groestl512":
            return hashMessage.groestl512groestl512()

        default:
            return "Invalid hash function \(type)"
        }
    }
}
