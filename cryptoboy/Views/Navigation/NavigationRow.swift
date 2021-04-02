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

                    if !item.description.isEmpty {
                        Text(item.description)
                            .font(.caption)
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
            return AnyView(BaseConverterView())

        case "hash":
            return AnyView(HashingView())

        case "encoding":
            return AnyView(EncodingView())

        case "decoding":
            return AnyView(DecodingView())

        case "qrcode":
            return AnyView(QRCodeGeneratorView())

        case "btc_unit":
            return AnyView(BitcoinUnitView())

        case "eth_unit":
            return AnyView(EthereumUnitView())

        default:
            return AnyView(ComingSoonView(item: item))
        }
    }
}

struct NavigationRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationRow(item: MenuItem.example)
            .environmentObject(AppState())
    }
}
