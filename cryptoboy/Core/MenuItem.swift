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
}
