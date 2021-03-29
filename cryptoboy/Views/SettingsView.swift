//
//  SettingsView.swift
//  cryptoboy
//
//  Created by Pavel on 26/03/2021.
//

import SwiftUI

struct SettingsView: View {
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
                // Donation
                Section(header: Text("Donate")) {
                    SettingsDonateItem("BTC", "1PVVjazdf7ye5oSpTcBq5CWKkCMHHQYD1m")
                    SettingsDonateItem("ETH", "0xC5362223D38d1d4ADbE36Dd78E77B5f4DbbC0F21")
                    SettingsDonateItem("BCH", "qrmtven6eellut9dm5v6ztaee9h9wu7zkulgd7crze")
                    SettingsDonateItem("XLM", "GAIDD763J2YXYZBGBWSWVT7Y6MPF2KTJO77OS2QXQ3FJ6UMN6GRDDGUC")
                }
                
                // System
                Section(header: Text("System")) {
                    HStack {
                        Text("App Version")
                        Spacer()
                        Text(appVersion)
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("Build Date")
                        Spacer()
                        Text(buildDate)
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
