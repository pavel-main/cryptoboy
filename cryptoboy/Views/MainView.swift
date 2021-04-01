//
//  MainView.swift
//  cryptoboy
//
//  Created by Pavel on 27/03/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var state: AppState

    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    #endif
    
    var body: some View {
        NavigationView {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                MainNavigationTabBar()
            } else {
                MainNavigationSideBar()
            }
            #else
            MainNavigationSideBar()
            #endif
        }
        .modifier(DarkModeViewModifier())
//        .modifier(ThemeViewModifier())
        .environmentObject(AppState())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppState())
    }
}
