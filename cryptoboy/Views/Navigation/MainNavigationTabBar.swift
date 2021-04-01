//
//  MainNavigationTabBar.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct MainNavigationTabBar: View {
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
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "list.star")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "wrench.and.screwdriver")
                }
        }
        .environmentObject(AppState())
    }
}
