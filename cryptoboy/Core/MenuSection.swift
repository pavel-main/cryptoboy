//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

struct MenuSection: Codable {
    var id: String
    var title: String
    var items: [MenuItem]
}
