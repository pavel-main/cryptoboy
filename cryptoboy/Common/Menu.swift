//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct MenuSection: Codable {
    var id: String
    var title: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Equatable {
    var id: String
    var title: String
    var systemImage: String
    var description: String
    var icons: [String]


    #if DEBUG
    static let example = MenuItem(
        id: "hash",
        title: "Hash Functions",
        systemImage: "number",
        description: "sha256, keccak256, ripemd160, ...",
        icons: ["new", "soon"]
    )
    #endif
}
