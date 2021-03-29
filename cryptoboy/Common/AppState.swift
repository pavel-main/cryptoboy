//
//  AppState.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

class AppState : ObservableObject {    
    @Published var amount: Decimal = Decimal.init(string: "1")!
    
    @AppStorage("hasMessageChanged") var hasMessageChanged: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    @AppStorage("message") var message: String = "" {
        didSet {            
            if (!hasMessageChanged) {
                hasMessageChanged = true
            }
        }
        willSet {
            objectWillChange.send()
        }
    }
    
    @AppStorage("bookmarks") var bookmarks: Array<String> = [] {
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
        self.clearMessage()
        self.visitedViews = []
        self.bookmarks = []
        self.amount = Decimal.init(string: "1")!
    }
    
    func getHashOrDefault(_ type: String, _ defaultValue: String) -> String {
        if (self.isDefaultMessage()) {
            return defaultValue
        }
        
        return message.hash(type)
    }
    
    func encodeOrDefault(_ type: String, _ defaultValue: String) -> String {
        if (self.isDefaultMessage()) {
            return defaultValue
        }
        
        return message.encode(type)
    }
}
