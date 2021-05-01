//
//  Extensions.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import Foundation
import WalletCore

extension String {

    func bytepad() -> String {
        let count = self.count
        if count % 2 != 0 {
            return String(self.prefix(count - 1) + "0" + self.suffix(1))
        }

        return self
    }

    func hash(_ type: HashFunction) -> String {
        if type == .bytepad {
            return self.bytepad()
        }

        let data = Data(self.utf8)
        return data.hash(type).hexString
    }
}
