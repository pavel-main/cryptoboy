//
//  QRCodeHelper.swift
//  cryptoboy
//
//  Created by Pavel on 01/04/2021.
//

import SwiftUI
import QRCoder

class QRCodeHelper {

    static let levels: [String: QRCodeGenerator] = [
        "L": build(QRCodeGenerator.CorrectionLevel.L),
        "M": build(QRCodeGenerator.CorrectionLevel.M),
        "Q": build(QRCodeGenerator.CorrectionLevel.Q),
        "H": build(QRCodeGenerator.CorrectionLevel.H)
    ]

    static func build(_ level: QRCodeGenerator.CorrectionLevel) -> QRCodeGenerator {
        return QRCodeGenerator(correctionLevel: level)
    }

    static func generate(from input: String, size: CGFloat, level: String) -> UIImage {
        if let generator = levels[level] {
            let image = generator.createImage(value: input, size: CGSize(width: size, height: size), encoding: .utf8)
            return image ?? UIImage()
        }

        return UIImage()
    }
}
