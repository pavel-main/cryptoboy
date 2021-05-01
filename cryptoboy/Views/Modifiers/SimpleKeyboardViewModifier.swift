//
//  DefaultKeyboardViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 26/04/2021.
//

import SwiftUI
import Introspect

public struct SimpleKeyboardViewModifier: ViewModifier {

    let flex = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    public func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .introspectTextField { (textField) in
                let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))

                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                doneButton.tintColor = .systemPink

                let items = [flex, doneButton]

                toolBar.items = items
                toolBar.setItems(items, animated: true)
                textField.inputAccessoryView = toolBar
             }
    }
}
