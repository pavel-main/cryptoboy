//
//  ItemRow.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct ItemRow : View {
    let item: MenuItem
    let colors: [String: Color] = ["new": .red, "soon": .blue]

    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack {
                Label("", systemImage: item.systemImage)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    
                    if (item.description != "") {
                        Text(item.description)
                            .font(.caption)
                    }
                }
                
                Spacer()
                
                ForEach(item.icons, id: \.self) { icon in
                    Text(icon)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[icon, default: .white])
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
