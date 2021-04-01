//
//  String+Filtering.swift
//  cryptoboy
//
//  Created by Pavel on 01/04/2021.
//

import Foundation

extension String {
    func replace(target: String, with: String) -> String {
        return self.replacingOccurrences(of: target, with: with, options: NSString.CompareOptions.literal, range: nil)
    }
}
