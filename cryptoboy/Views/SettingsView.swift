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

    var buildDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: state.rawBuildDate)
    }

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

                // Donate
                Section(header: Text("Donate")) {
                    AboutDonateItem("BTC", "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
                    AboutDonateItem("ETH", "0xC5362223D38d1d4ADbE36Dd78E77B5f4DbbC0F21")
                    AboutDonateItem("BCH", "qrmtven6eellut9dm5v6ztaee9h9wu7zkulgd7crze")
                    AboutDonateItem("XLM", "GAIDD763J2YXYZBGBWSWVT7Y6MPF2KTJO77OS2QXQ3FJ6UMN6GRDDGUC")
                }

                // System
                Section(header: Text("System")) {
                    AboutSystemItem("App Version", state.appVersion)
                    AboutSystemItem("Build Date", buildDate)
                    AboutLinkItem("Issue Tracker", title: "GitHub", url: "https://github.com/CryptoboyApp/issues")
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
                                state.clearState()
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
