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

    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
           return version
        }

        return "1.0"
    }

    var rawBuildDate: Date {
        if let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath),
            let infoDate = infoAttr[.creationDate] as? Date {
            return infoDate
        }
        return Date()
    }

    var buildDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: rawBuildDate)
    }

    var body: some View {
        List {
            // Donation
            Section(header: Text("Donate")) {
                AboutDonateItem("BTC", "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
                AboutDonateItem("ETH", "0xC5362223D38d1d4ADbE36Dd78E77B5f4DbbC0F21")
                AboutDonateItem("BCH", "qrmtven6eellut9dm5v6ztaee9h9wu7zkulgd7crze")
                AboutDonateItem("XLM", "GAIDD763J2YXYZBGBWSWVT7Y6MPF2KTJO77OS2QXQ3FJ6UMN6GRDDGUC")
            }

            // System
            Section(header: Text("System")) {
                AboutSystemItem("App Version", appVersion)
                AboutSystemItem("Build Date", buildDate)
            }

            // Actions
            Section(header: Text("Actions")) {
                Toggle(isOn: $isDarkMode) {
                    Label("Dark Mode", systemImage: "moon.stars")
                }

                NavigationLink(destination: SelectThemeView()) {
                    Label("Color Theme", systemImage: "paintbrush")
                }

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
            }
            .alert(isPresented: $showClearPrompt) {
                Alert(
                    title: Text("Clear Application State"),
                    message: Text("Are you sure?"),
                    primaryButton: .destructive(Text("Reset")) {
                        state.clearState()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        //.listStyle(GroupedListStyle())
        .navigationTitle("Settings")
        //.navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AppState())
    }
}
