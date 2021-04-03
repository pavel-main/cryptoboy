//
//  PageType.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

enum PageType {
    case base
    case hash
    case encoding
    case keypair
    case qrcode
    case btc_unit
    case eth_unit
    case dot_unit
    case unknown

    var title: String {
        switch self {
            case .base:
                return "Base Converter"
            case .hash:
                return "Hashing"
            case .encoding:
                return "Encoding"
            case .keypair:
                return "Keypair Generator"
            case .qrcode:
                return "QR Code Generator"
            case .btc_unit:
                return "BTC Unit Converter"
            case .eth_unit:
                return "ETH Unit Converter"
            case .dot_unit:
                return "DOT Unit Converter"
            case .unknown:
                return "Coming Soon!"
        }
    }
}
