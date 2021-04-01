//
//  MainNavigationSideBar.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct MainNavigationSideBar: View {
    @EnvironmentObject var state: AppState
    
    enum NavigationItem {
        case functions
        case currencies
        case favorites
        case settings
    }
    
    @State var selection: Set<NavigationItem> = [.functions]

    var body: some View {
        List(selection: $selection) {
            NavigationLink(
                destination: FunctionsView(),
                label: {
                    Label("Functions", systemImage: "function")
                }
            )
            .tag(NavigationItem.functions)
            
            NavigationLink(
                destination: CurrenciesView(),
                label: {
                    Label("Currencies", systemImage: "bitcoinsign.circle")
                }
            )
            .tag(NavigationItem.currencies)
            
            NavigationLink(
                destination: FavoritesView(),
                label: {
                    Label("Favorites", systemImage: "list.star")
                }
            )
            .tag(NavigationItem.favorites)
            
            NavigationLink(
                destination: SettingsView(),
                label: {
                    Label("Settings", systemImage: "wrench.and.screwdriver")
                }
            )
            .tag(NavigationItem.settings)
        }
        .listStyle(SidebarListStyle())
        .environmentObject(AppState())
    }
}
