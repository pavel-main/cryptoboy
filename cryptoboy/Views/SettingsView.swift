//
//  AboutView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var state: AppState
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @State private var showClearPrompt = false

    var body: some View {
        NavigationView {
            List {
                // Style
                Section(header: Text("Style")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Dark Mode", systemImage: "moon.stars")
                    }

                    NavigationLink(destination: SelectThemeView()) {
                        Label("Color Theme", systemImage: "paintbrush")
                    }
                }

                // System
                Section(header: Text("System")) {
                    AboutSystemItem("App Version", state.sys.appVersion)
                    AboutSystemItem("Build Date", state.sys.buildDate)
                    AboutLinkItem("Issue Tracker", title: "GitHub", url: "https://github.com/CryptoboyApp/issues")
                }

                // Donate
                Section(header: Text("Donate")) {
                    AboutDonateItem("BTC", "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
                    AboutDonateItem("ETH", "0xC5362223D38d1d4ADbE36Dd78E77B5f4DbbC0F21")
                    AboutDonateItem("XLM", "GAIDD763J2YXYZBGBWSWVT7Y6MPF2KTJO77OS2QXQ3FJ6UMN6GRDDGUC")
                }

                // Danger
                Section(header: Text("Danger")) {
                    Button(action: {
                        showClearPrompt.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "trash")
                            Text("Clear Application State")
                            Spacer()
                        }
                        .foregroundColor(.red)
                    }
                    .alert(isPresented: $showClearPrompt) {
                        Alert(
                            title: Text("Clear App State"),
                            message: Text("Are you sure?"),
                            primaryButton: .destructive(Text("Clear")) {
                                state.reset()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}
