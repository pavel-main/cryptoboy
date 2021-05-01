//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI
import WalletCore

class AppState: ObservableObject {
    // Immutable
    let sys = SystemState()
    let menu = MenuState()
    let theme = ThemeState()

    // Mutable
    @Published var bytes = BinaryState() {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var message = MessageState() {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var keypair = KeypairState() {
        willSet {
            objectWillChange.send()
        }
    }

    // Flags
    @Published var isBin: Bool = false
    @Published var isDecoding: Bool = false
    
    // Theme
    @AppStorage("currentTheme") var currentTheme: String = "green" {
        willSet {
            objectWillChange.send()
        }
    }
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = true {
        willSet {
            objectWillChange.send()
        }
    }
    
    
    @AppStorage("isFemale") var isFemale: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    // Clipboard
    @AppStorage("clipboard") var clipboard: [String] = [] {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        print("Loading CryptoBoy \(sys.appVersion)")

        // Workaround QRCoder init lag
        _ = QRCodeHelper.generate(from: "cryptoboy", size: CGFloat(320), level: "M")
    }

    func invertedColor() -> Color {
        if isDarkMode {
            return Color.white
        }
        return Color.black
    }

    /* Clipboard management */
    func addClipboard(_ item: String) {
        if !self.clipboard.contains(item) {
            self.clipboard.insert(item, at: 0)
        }
    }

    func removeClipboard(at offsets: IndexSet) {
        if !self.clipboard.isEmpty {
            self.clipboard.remove(atOffsets: offsets)
        }
    }

    /* State reset */
    func resetBytes() {
        self.bytes = BinaryState()
    }

    func resetMessage() {
        self.message = MessageState()
    }

    func resetKeypair() {
        self.keypair = KeypairState()
    }

    func reset() {
        ClipboardHelper.resetString()

        resetMessage()
        resetBytes()
        resetKeypair()

        self.isFemale = false
        self.isDarkMode = true
        self.currentTheme = "green"

        self.clipboard = []
    }
}
