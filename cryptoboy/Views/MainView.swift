//
//  MainView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        TabView {
            FunctionsView()
                .tabItem {
                    Label("Functions", systemImage: "function")
                }
            CurrenciesView()
                .tabItem {
                    Label("Currencies", systemImage: "bitcoinsign.circle")
                }
            ClipboardView()
                .tabItem {
                    Label("Clipboard", systemImage: "mail.stack")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "wrench.and.screwdriver")
                }
        }
        .modifier(DarkModeViewModifier())
        .modifier(ThemeViewModifier())
        .environmentObject(state)
    }
}
