//
//  HexKeyboardViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 26/04/2021.
//

import SwiftUI
import Introspect

public struct HexKeyboardViewModifier: ViewModifier {

    let hex: Bool

    let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    public func body(content: Content) -> some View {
        content
            .keyboardType(.asciiCapableNumberPad)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .introspectTextField { (textField) in
                let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))

                let a = buildButton("A", textField)
                let b = buildButton("B", textField)
                let c = buildButton("C", textField)
                let d = buildButton("D", textField)
                let e = buildButton("E", textField)
                let f = buildButton("F", textField)

                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                doneButton.tintColor = .systemPink

                var items = [flex, doneButton]
                if self.hex {
                    items = [a, flex, b, flex, c, flex, d, flex, e, flex, f, flex, doneButton]
                }

                toolBar.items = items
                toolBar.setItems(items, animated: true)
                textField.inputAccessoryView = toolBar
             }
    }

    func buildButton(_ title: String, _ textField: UITextField) -> UIBarButtonItem {
        let button = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(textField.hexButtonTapped(button:)))
        button.tintColor = .systemPink
        return button
    }
}
