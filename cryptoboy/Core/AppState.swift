//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI
import WalletCore

class AppState: ObservableObject {
    @Environment(\.colorScheme) var colorScheme

    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("currentTheme") var currentTheme: String = DEFAULT_THEME

    @AppStorage("hasMessageChanged") var hasMessageChanged: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    @AppStorage("isMessageBinary") var isMessageBinary: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    @AppStorage("message") var message: String = "" {
        didSet {
            if !hasMessageChanged {
                hasMessageChanged = true
            }
        }
        willSet {
            objectWillChange.send()
        }
    }

    @Published var privateKey: PrivateKey?

    @AppStorage("bookmarks") var bookmarks: [String] = [] {
        willSet {
            objectWillChange.send()
        }
    }

    @AppStorage("visitedViews") var visitedViews: Set<String> = [] {
        willSet {
            objectWillChange.send()
        }
    }

    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
           return version
        }

        return "1.0"
    }

    var rawBuildDate: Date {
        if let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath),
            let infoDate = infoAttr[.creationDate] as? Date {
            return infoDate
        }
        return Date()
    }

    let functionsMenu = Bundle.main.decode([MenuSection].self, from: "functions.json")
    let currenciesMenu = Bundle.main.decode([MenuSection].self, from: "currencies.json")

    init() {
        print("Loading CryptoBoy \(appVersion)")

        // Workaround QRCoder init lag
        _ = QRCodeHelper.generate(from: "cryptoboy", size: CGFloat(320), level: "M")
    }

    func getMenuItem(_ id: String) -> MenuItem? {
        let menuItems = functionsMenu.flatMap { $0.items } + currenciesMenu.flatMap { $0.items }
        return menuItems.filter { $0.id == id }.first
    }

    func isDefaultMessage() -> Bool {
        return message.isEmpty && !hasMessageChanged
    }

    func visitView(_ view: String) {
        visitedViews.insert(view)
    }

    func hasVisited(_ view: String) -> Bool {
        return visitedViews.contains(view)
    }

    func addBookmark(_ view: String) {
        bookmarks.append(view)
        bookmarks = bookmarks.reversed()
    }

    func hasBookmark(_ view: String) -> Bool {
        return bookmarks.contains(view)
    }

    func removeBookmark(_ view: String) {
        if let index = bookmarks.firstIndex(of: view) {
            bookmarks.remove(at: index)
        }
    }

    func clearMessage() {
        self.message = ""
        self.hasMessageChanged = false
    }

    func clearPrivateKey() {
        self.privateKey = nil
    }

    func clearState() {
        self.isDarkMode = true
        self.currentTheme = DEFAULT_THEME

        self.clearMessage()
        self.visitedViews = []
        self.bookmarks = []
    }

    func invertedColor() -> Color {
        if isDarkMode {
            return Color.white
        }
        return Color.black
    }

    func getHashOrDefault(_ type: HashFunction) -> String {
        if self.isDefaultMessage() {
            return type.title
        }
        
        if self.isMessageBinary {
            guard let data = Data(fromHexEncodedString: self.message) else {
                return "Error parsing hex-encoded bytes"
            }
            
            return data.hash(type)
        }

        return message.hash(type)
    }

    func encodeOrDefault(_ type: EncodingFormat) -> String {
        if self.isDefaultMessage() {
            return type.title
        }

        return message.encode(type)
    }

    func publicKeyOrDefault(_ type: EllipticCurvePublicKey) -> String {
        guard let privateKey = self.privateKey else {
            return ""
        }

        return type.getPublicKey(from: privateKey).description
    }
}
