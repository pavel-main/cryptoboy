//
//  Extensions.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import Foundation
import WalletCore

extension String {

    func sha256() -> String {
        return Hash.sha256(data: Data(self.utf8)).hexString
    }
}
