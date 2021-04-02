//
//  MenuItem.swift
//  cryptoboy
//
//  Created by Pavel on 03/04/2021.
//

struct MenuItem: Codable, Equatable {
    var id: String
    var title: String
    var systemImage: String
    var description: String = ""
    var icons: [String] = []

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
