//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

class AppState: ObservableObject {
    @Environment(\.colorScheme) var colorScheme

    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("currentTheme") var currentTheme: String = "blue"

    @Published var amount: String = "1"

    @AppStorage("hasMessageChanged") var hasMessageChanged: Bool = false {
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

    let functionsMenu = Bundle.main.decode([MenuSection].self, from: "functions.json")
    let currenciesMenu = Bundle.main.decode([MenuSection].self, from: "currencies.json")

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

    func clearState() {
        self.isDarkMode = true
        self.currentTheme = "blue"

        self.clearMessage()
        self.amount = "1"

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

        return message.hash(type)
    }

    func encodeOrDefault(_ type: EncodingFormat) -> String {
        if self.isDefaultMessage() {
            return type.title
        }

        return message.encode(type)
    }
}
