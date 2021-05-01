//
//  SystemState.swift
//  cryptoboy
//
//  Created by Pavel on 01/05/2021.
//

import Foundation

class SystemState {
    // App Version
    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
           return version
        }

        return "1.0"
    }

    // Build Date
    var buildDate: String {
        var rawDate: Date {
            if let infoPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
                let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath),
                let infoDate = infoAttr[.creationDate] as? Date {
                return infoDate
            }

            return Date()
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: rawDate)
    }
}
