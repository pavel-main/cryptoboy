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

    @AppStorage("isFemale") var isFemale: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("currentTheme") var currentTheme: String = DEFAULT_THEME

    @AppStorage("hasMessageChanged") var hasMessageChanged: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }

    @AppStorage("hasMessageBytesChanged") var hasMessageBytesChanged: Bool = false {
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

    @AppStorage("messageBytes") var messageBytes: String = "" {
        didSet {
            if !hasMessageBytesChanged {
                hasMessageBytesChanged = true
            }
        }
        willSet {
            objectWillChange.send()
        }
    }

    @Published var privateKey: PrivateKey?
    @Published var digestType: HashFunction = .sha256
    @Published var isMessageBinary: Bool = false
    @Published var isDecoding: Bool = false

    @AppStorage("visitedViews") var visitedViews: Set<String> = [] {
        willSet {
            objectWillChange.send()
        }
    }

    @AppStorage("clipboard") var clipboard: [String] = [] {
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

    init() {
        print("Loading CryptoBoy \(appVersion)")

        // Workaround QRCoder init lag
        _ = QRCodeHelper.generate(from: "cryptoboy", size: CGFloat(320), level: "M")
    }

    func getMenuItem(_ id: String) -> MenuItem? {
        let menuItems = functionsMenu.flatMap { $0.items } + currenciesMenu.flatMap { $0.items }
        return menuItems.filter { $0.id == id }.first
    }

    func getDestination(from item: MenuItem) -> AnyView {
        let pageType = PageType(rawValue: item.id) ?? .unknown
        return pageType.getView(item)
    }

    func isDefaultMessage(_ isBinary: Bool) -> Bool {
        if isBinary {
            return messageBytes.isEmpty && !hasMessageBytesChanged
        }

        return message.isEmpty && !hasMessageChanged
    }

    func visitView(_ view: String) {
        visitedViews.insert(view)
    }

    func hasVisited(_ view: String) -> Bool {
        return visitedViews.contains(view)
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

    func clearMessage() {
        self.message = ""
        self.hasMessageChanged = false
    }

    func clearMessageBytes() {
        self.messageBytes = ""
        self.hasMessageBytesChanged = false
    }

    func clearPrivateKey() {
        self.privateKey = nil
    }

    func clearState() {
        self.isFemale = false
        self.isDarkMode = true
        self.currentTheme = DEFAULT_THEME

        self.clearMessage()
        self.visitedViews = []
        self.clipboard = []
    }

    func getTheme(_ themeName: String?) -> Theme {
        if themeName != nil {
            for theme in themes {
                if themeName! == theme.name {
                    return theme
                }
            }
        }

        return themes[0]
    }

    func invertedColor() -> Color {
        if isDarkMode {
            return Color.white
        }
        return Color.black
    }

    func getHash(_ type: HashFunction) -> String {
        return message.hash(type)
    }

    func getBinaryHash(_ type: HashFunction) -> String? {
        guard let data = Data(fromHexEncodedString: self.messageBytes.bytepad()) else {
            return nil
        }

        return data.hash(type).hexString
    }

    func encode(_ type: EncodingFormat) -> String {
        return message.encode(type)
    }

    func publicKeyOrDefault(_ type: EllipticCurvePublicKey) -> String {
        guard let privateKey = self.privateKey else {
            return ""
        }

        return type.getPublicKey(from: privateKey).description
    }
}
