//
//  EncodingView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct HashingView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        Form {
            Section(header: Text("Input Message")) {
                HStack {
                    Image(systemName: "ellipsis.bubble")

                    TextEditor(text: $state.message)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)

                    Button(action: state.clearMessage) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }

            Group {
                HashingItemView(.sha1)
                HashingItemView(.sha256)
                HashingItemView(.sha512)
                HashingItemView(.keccak256)
                HashingItemView(.keccak512)
                HashingItemView(.ripemd160)
                HashingItemView(.blake256)
                HashingItemView(.groestl512)
            }

            Group {
                HashingItemView(.sha256ripedm160)
                HashingItemView(.sha256sha256)
                HashingItemView(.blake256ripedm160)
                HashingItemView(.blake256blake256)
                HashingItemView(.groestl512groestl512)
            }
        }
        .modifier(NavigationViewModifier(page: .hash))
    }
}
