//
//  Decimal+Rounding.swift
//  RoundedDecimal
//
//  Created by Chris Hargreaves on 16/09/2018.
//  Copyright © 2018 Software Engineering Limited. All rights reserved.
//

import Foundation

internal extension Decimal {
    
    func rounding(accordingToBehavior behaviour: NSDecimalNumberHandler) -> Decimal {
        
        return (self as NSDecimalNumber).rounding(accordingToBehavior: behaviour) as Decimal
    }
}
