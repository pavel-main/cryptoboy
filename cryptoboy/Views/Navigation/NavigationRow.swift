//
//  NavigationRow.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct NavigationRow: View {
    @EnvironmentObject var state: AppState

    let item: MenuItem
    let colors: [String: Color] = ["new": .red, "soon": .blue]

    var body: some View {
        NavigationLink(destination: getDestination(from: item)) {
            HStack {
                Label(String(), systemImage: item.systemImage)

                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .lineLimit(1)

                    if !item.description.isEmpty {
                        Text(item.description)
                            .font(.caption)
                            .lineLimit(1)
                    }
                }

                Spacer()

                // Icons
                ForEach(item.icons, id: \.self) { icon in
                    if icon == "soon" || !state.hasVisited(item.id) {
                        Text(icon)
                            .textCase(.uppercase)
                            .font(.caption)
                            .padding(5)
                            .background(colors[icon, default: state.invertedColor()])
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .environmentObject(state)
    }

    func getDestination(from item: MenuItem) -> AnyView {
        switch item.id {
        case "base":
            return AnyView(BaseUnitConverterView())

        case "uint256":
            return AnyView(ArbitaryPrecisionView())

        case "hash":
            return AnyView(HashingView())

        case "encoding":
            return AnyView(EncodingView())

        case "keypair":
            return AnyView(EllipticCurveView())

        case "ecdh":
            return AnyView(DiffieHellmanView())

        case "ecdsa":
            return AnyView(DigitalSignaturesView())

        case "qrcode":
            return AnyView(QRCodeGeneratorView())

        case "btc_unit":
            return AnyView(BitcoinUnitView())

        case "eth_unit":
            return AnyView(EthereumUnitView())

        case "dot_unit":
            return AnyView(PolkadotUnitView())

        default:
            return AnyView(ComingSoonView(item: item))
        }
    }
}
