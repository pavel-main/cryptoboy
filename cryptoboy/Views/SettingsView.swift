//
//  AboutView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var state: AppState
    @State private var showClearPrompt = false
    @State private var showClearAlert = false
    
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
        NavigationView {
            List {
                // Contact
                Section(header: Text("Contact")) {
                    AboutLinkItem("E-mail", title: "cryptoboy2283@gmail.com", url: "mailto:cryptoboy2283@gmail.com")
                }
                
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
                    NavigationLink(destination: SelectThemeView()) {
                        Label("Select theme", systemImage: "paintbrush")
                    }
                    
                    Button(action: {
                        showClearPrompt.toggle()
                    }) {
                        HStack {
                            Spacer()
                            Image(systemName: "trash")
                            Text("Clear Application State")
                            Spacer()
                        }.foregroundColor(.red)
                    }
                }
                .alert(isPresented: $showClearPrompt) {
                    Alert(
                        title: Text("Reset Application State"),
                        message: Text("Are you sure?"),
                        primaryButton: .destructive(Text("Clear")) {
                            state.clearState()
                            showClearAlert.toggle()
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            .alert(isPresented: $showClearAlert) {
                Alert(
                    title: Text("Reset Successful"),
                    message: Text("Application state was cleared"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(state)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AppState())
    }
}
