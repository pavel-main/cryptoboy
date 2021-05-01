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

    // TODO
    @Environment(\.colorScheme) var colorScheme

    @AppStorage("currentTheme") var currentTheme: String = "green"
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("isFemale") var isFemale: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var isBin: Bool = false
    @Published var isDecoding: Bool = false

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
