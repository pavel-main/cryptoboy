//
//  UITextField.swift
//  cryptoboy
//
//  Created by Pavel on 26/04/2021.
//

import Foundation
import SwiftUI

extension UITextField {
   @objc func doneButtonTapped(button: UIBarButtonItem) {
      self.resignFirstResponder()
   }

    @objc func hexButtonTapped(button: UIBarButtonItem) {
        self.insertText(button.title!)
    }
}
