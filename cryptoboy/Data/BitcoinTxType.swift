//
//  BitcoinTxType.swift
//  cryptoboy
//
//  Created by Pavel on 03/05/2021.
//

import Foundation

enum BitcoinTxType: String {
    case p2pkh = "P2PKH"
    case p2wpkh = "P2WPKH"
    case p2sh = "P2KSH"
    case p2wsh = "P2WSH"
    case p2tr = "P2TR"
}
