//
//  PageType.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

enum PageType {
    case hash
    case encoding
    case qrcode
    case btc_unit
    case eth_unit
    case unknown

    var title: String {
        switch self {
            case .hash:
                return "Hashing"
            case .encoding:
                return "Encoding"
            case .qrcode:
                return "QR Code Generator"
            case .btc_unit:
                return "BTC Unit Converter"
            case .eth_unit:
                return "ETH Unit Converter"
            case .unknown:
                return "Coming Soon!"
        }
    }
}
