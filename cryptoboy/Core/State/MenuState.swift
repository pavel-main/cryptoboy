//
//  MenuState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation
import SwiftUI

class MenuState {
    let functions: [MenuSection] = [
        // Math
        MenuSection(id: "math", title: "Math", items: [
            MenuItem(
                id: "base",
                title: "Base Converter",
                systemImage: "textformat.123",
                description: "binary, octal, decimal, hex"
            ),
            MenuItem(
                id: "uint256",
                title: "Arbitary-precision arithmetic",
                systemImage: "scope",
                description: "BigInt add, sub, mul, div"
            )
        ]),
        // Data
        MenuSection(id: "data", title: "Data", items: [
            MenuItem(
                id: "hash",
                title: "Hashing",
                systemImage: "number",
                description: "sha256, keccak256, ripemd160"
            ),
            MenuItem(
                id: "encoding",
                title: "Encoding",
                systemImage: "curlybraces",
                description: "hex, base58, base64"
            )
        ]),
        // ECC
        MenuSection(id: "ecc", title: "Elliptic Curves", items: [
            MenuItem(
                id: "keypair",
                title: "Keypair Generator",
                systemImage: "waveform.path",
                description: "secp256k1, ed25519, curve25519"
            ),
            MenuItem(
                id: "ecdh",
                title: "Diffie-Hellman",
                systemImage: "figure.stand.line.dotted.figure.stand",
                description: "Key Exchange"
            ),
            MenuItem(
                id: "ecdsa",
                title: "Digital Signatures",
                systemImage: "signature",
                description: "ECDSA with SHA-256",
                icons: ["new"]
            )
        ]),
        // Exchange
        MenuSection(id: "exchange", title: "Exchange", items: [
            MenuItem(
                id: "qrcode",
                title: "QR Code Generator",
                systemImage: "qrcode"
            ),
            MenuItem(
                id: "shamir",
                title: "Shamir Secret Sharing",
                systemImage: "person.3",
                icons: ["new"]
            )
        ])
    ]

    let currencies: [MenuSection] = [
        // Bitcoin
        MenuSection(id: "btc", title: "Bitcoin", items: [
            MenuItem(
                id: "btc_unit",
                title: "Unit Converter",
                systemImage: "dollarsign.circle",
                description: "BTC, mBTC, μBTC, satoshi"
            ),
            MenuItem(
                id: "btc_wallet",
                title: "HD Wallet",
                systemImage: "lock.rectangle.stack",
                description: "BIP39, BIP44, BIP141",
                icons: ["soon"]
            ),
            MenuItem(
                id: "btc_tx_size",
                title: "Transaction Size Calculator",
                systemImage: "percent",
                description: "p2pkh, p2sh, p2wkph, p2wsh",
                icons: ["new"]
            ),
            MenuItem(
                id: "btc_pubkey_compress",
                title: "Public Key Compression",
                systemImage: "rectangle.compress.vertical",
                icons: ["soon"]
            ),
            MenuItem(
                id: "btc_wif",
                title: "Wallet Import Format",
                systemImage: "square.and.arrow.down",
                icons: ["soon"]
            )
        ]),
        // Ethereum
        MenuSection(id: "eth", title: "Ethereum", items: [
            MenuItem(
                id: "eth_unit",
                title: "Unit Converter",
                systemImage: "eurosign.circle",
                description: "Ether, Finney, Szabo, Gwei, wei"
            ),
            MenuItem(
                id: "eth_checksum",
                title: "Address Checksum",
                systemImage: "checkmark.seal",
                icons: ["soon"]
            )
        ]),
        // Polkadot
        MenuSection(id: "dot", title: "Polkadot", items: [
            MenuItem(
                id: "dot_unit",
                title: "Unit Converter",
                systemImage: "sterlingsign.circle",
                description: "DOT, mDOT, μBTC, planck"
            )
        ]),
        // Litecoin
        MenuSection(id: "ltc", title: "Litecoin", items: [
            MenuItem(
                id: "ltc_unit",
                title: "Unit Converter",
                systemImage: "turkishlirasign.circle",
                description: "LTC, mLTC, photon"
            )
        ])
    ]

    func getMenuItem(_ id: String) -> MenuItem? {
        let menuItems = functions.flatMap { $0.items } + currencies.flatMap { $0.items }
        return menuItems.filter { $0.id == id }.first
    }

    func getView(_ item: MenuItem) -> AnyView {
        let pageType = PageType(rawValue: item.id) ?? .unknown
        return pageType.getView(item)
    }
}
