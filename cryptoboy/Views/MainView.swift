//
//  MainView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var state: AppState
    @State var currentTheme: Theme = getCurrentTheme()
    
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
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
        .accentColor(currentTheme.colorPrimary)
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "themeUpdated"), object: nil , queue: nil) { (notification) in
                DispatchQueue.main.async {
                    self.currentTheme = getCurrentTheme()
                }
            }
        }
        .environmentObject(AppState())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppState())
    }
}
