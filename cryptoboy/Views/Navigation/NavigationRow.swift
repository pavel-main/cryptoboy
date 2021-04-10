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
        NavigationLink(destination: state.getDestination(from: item)) {
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
}
