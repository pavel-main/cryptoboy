//
//  HexKeyboardViewModifier.swift
//  cryptoboy
//
//  Created by Pavel on 26/04/2021.
//

import SwiftUI
import Introspect

public struct HexKeyboardViewModifier: ViewModifier {

    public func body(content: Content) -> some View {
        content
            .keyboardType(.asciiCapableNumberPad)
            .introspectTextField { (textField) in
                let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                
                let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                
                let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                doneButton.tintColor = .systemPink
                
                toolBar.items = [flexButton, doneButton]
                toolBar.setItems([flexButton, doneButton], animated: true)
                
                textField.inputAccessoryView = toolBar
             }
    }
}

