//
//  Predef.swift
//  cryptoboy
//
//  Created by Pavel on 10/04/2021.
//

import SwiftUI

let DEFAULT_THEME = "green"

let themes: [Theme] = [
    Theme(colorPrimary: Color.primary, name: "system", publicName: "System"),
    // Male
    Theme(colorPrimary: Color.red, name: "red", publicName: "Red", female: false),
    Theme(colorPrimary: Color.purple, name: "purple", publicName: "Purple", female: false),
    Theme(colorPrimary: Color.pink, name: "pink", publicName: "Pink", female: false),
    Theme(colorPrimary: Color.orange, name: "orange", publicName: "Orange", female: false),
    Theme(colorPrimary: Color.yellow, name: "yellow", publicName: "Yellow", female: false),
    Theme(colorPrimary: Color.green, name: "green", publicName: "Green", female: false),
    Theme(colorPrimary: Color.blue, name: "blue", publicName: "Blue", female: false),
    // Female Red
    Theme(colorPrimary: Color("scarlet"), name: "scarlet", publicName: "Scarlet", female: true),
    Theme(colorPrimary: Color("dark-red"), name: "dark-red", publicName: "Dark Red", female: true),
    Theme(colorPrimary: Color("wine-red"), name: "wine-red", publicName: "Wine Red", female: true),
    // Female Purple
    Theme(colorPrimary: Color("plum"), name: "plum", publicName: "Plum", female: true),
    Theme(colorPrimary: Color("eggplant"), name: "eggplant", publicName: "Eggplant", female: true),
    Theme(colorPrimary: Color("grape"), name: "grape", publicName: "Grape", female: true),
    Theme(colorPrimary: Color("violet"), name: "violet", publicName: "Violet", female: true),
    Theme(colorPrimary: Color("lavender"), name: "lavender", publicName: "Lavender", female: true),
    // Female Pink
    Theme(colorPrimary: Color("carnation"), name: "carnation", publicName: "Carnation", female: true),
    Theme(colorPrimary: Color("strawberry"), name: "strawberry", publicName: "Strawberry", female: true),
    Theme(colorPrimary: Color("fuchsia"), name: "fuchia", publicName: "Fuchsia", female: true),
    Theme(colorPrimary: Color("salmon"), name: "salmon", publicName: "Salmon", female: true),
    // Female Orange
    Theme(colorPrimary: Color("orange"), name: "orange-female", publicName: "Orange", female: true),
    Theme(colorPrimary: Color("melon"), name: "melon", publicName: "Melon", female: true),
    // Female Yellow
    Theme(colorPrimary: Color("yellow"), name: "yellow-female", publicName: "Yellow", female: true),
    Theme(colorPrimary: Color("lemon"), name: "lemon", publicName: "Lemon", female: true),
    // Female Green
    Theme(colorPrimary: Color("lime"), name: "lime", publicName: "Lime", female: true),
    Theme(colorPrimary: Color("fresh-grass"), name: "fresh-grass", publicName: "Fresh Grass", female: true),
    Theme(colorPrimary: Color("green"), name: "green-female", publicName: "Green", female: true),
    Theme(colorPrimary: Color("dark-green"), name: "dark-green", publicName: "Dark Green", female: true),
    Theme(colorPrimary: Color("moss"), name: "moss", publicName: "Moss", female: true),
    Theme(colorPrimary: Color("green-yellow"), name: "green-yellow", publicName: "Green Yellow", female: true),
    // Female Blue
    Theme(colorPrimary: Color("sea-green"), name: "sea-green", publicName: "Sea Green", female: true),
    Theme(colorPrimary: Color("blue-green"), name: "blue-green", publicName: "Blue Green", female: true),
    Theme(colorPrimary: Color("sky-blue"), name: "sky-blue", publicName: "Sky Blue", female: true),
    Theme(colorPrimary: Color("turquoise"), name: "turquoise", publicName: "Turquoise", female: true)
]

let functionsMenu: [MenuSection] = [
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
            description: "BigInt add, sub, mul, div",
            icons: ["new"]
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
        ),
        MenuItem(
            id: "encryption",
            title: "Encryption",
            systemImage: "lock.shield",
            description: "AES-CBC, AES-CTR",
            icons: ["soon"]
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
            description: "ECDSA",
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

let currenciesMenu: [MenuSection] = [
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
            id: "btc_tx_fee",
            title: "Transaction Fee Estimation",
            systemImage: "percent",
            description: "p2pkh, p2sh, p2wkph",
            icons: ["soon"]
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
    ]),
    // Bitcoin Cash
    MenuSection(id: "bch", title: "Bitcoin Cash", items: [
        MenuItem(
            id: "bch_cashaddr",
            title: "CashAddr Converter",
            systemImage: "banknote",
            icons: ["soon"]
        )
    ])
]
