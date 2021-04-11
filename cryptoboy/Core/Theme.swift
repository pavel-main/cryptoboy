//
//  Theme.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

struct Theme: Hashable, Equatable {
    var colorPrimary: Color = Color.primary
    var name: String = "system"
    var publicName: String = "System"
    var female: Bool?
}
