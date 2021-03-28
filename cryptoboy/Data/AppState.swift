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
    
    @Published var bookmarks: Array<String> = []
    @Published var visitedViews: Set<String> = []
    
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
    
    func getHashOrDefault(_ type: String, _ defaultValue: String) -> String {
        if (self.isDefaultMessage()) {
            return defaultValue
        }
        
        return message.hash(type)
    }
}
