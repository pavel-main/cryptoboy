//
//  PageType.swift
//  cryptoboy
//
//  Created by Pavel on 30/03/2021.
//

import SwiftUI

enum PageType: String {
    case base
    case uint256
    case hash
    case encoding
    case keypair
    case ecdh
    case ecdsa
    case qrcode
    case shamir
    case btc_unit
    case btc_tx_size
    case eth_unit
    case dot_unit
    case ltc_unit
    case unknown

    var title: String {
        switch self {
            case .base:
                return "Base Converter"
            case .uint256:
                return "Arbitary-precision arithmetic"
            case .hash:
                return "Hashing"
            case .encoding:
                return "Encoding"
            case .keypair:
                return "Keypair Generator"
            case .ecdh:
                return "Diffie-Hellman"
            case .ecdsa:
                return "Digital Signatures"
            case .qrcode:
                return "QR Code Generator"
            case .shamir:
                return "Shamir Secret Sharing"
            case .btc_unit:
                return "BTC Unit Converter"
            case .btc_tx_size:
                return "BTC Tx Size Calculator"
            case .eth_unit:
                return "ETH Unit Converter"
            case .dot_unit:
                return "DOT Unit Converter"
            case .ltc_unit:
                return "LTC Unit Converter"
            case .unknown:
                return "Coming Soon!"
        }
    }

    func getView(_ item: MenuItem) -> AnyView {
        switch self {
        case .base:
            return AnyView(BaseUnitConverterView())

        case .uint256:
            return AnyView(ArbitaryPrecisionView())

        case .hash:
            return AnyView(HashingView())

        case .encoding:
            return AnyView(EncodingView())

        case .keypair:
            return AnyView(EllipticCurveView())

        case .ecdh:
            return AnyView(DiffieHellmanView())

        case .ecdsa:
            return AnyView(DigitalSignaturesView())

        case .qrcode:
            return AnyView(QRCodeGeneratorView())

        case .shamir:
            return AnyView(ShamirSecretView())

        case .btc_unit:
            return AnyView(BitcoinUnitView())

        case .btc_tx_size:
            return AnyView(BitcoinTransactionSizeView())
            
        case .eth_unit:
            return AnyView(EthereumUnitView())

        case .dot_unit:
            return AnyView(PolkadotUnitView())

        case .ltc_unit:
            return AnyView(LitecoinUnitView())

        default:
            return AnyView(ComingSoonView(item: item))
        }
    }

}
