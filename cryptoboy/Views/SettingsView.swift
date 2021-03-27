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
            VStack {
                Text("App Version: \(appVersion)")
                    .padding()
                Text("Build Date: \(buildDate)")
                    .padding()
            }
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
