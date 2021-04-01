//
//  RoundedDecimal.swift
//  RoundedDecimal
//
//  Created by Chris Hargreaves on 09/09/2019.
//  Copyright © 2019 Software Engineering Limited. All rights reserved.
//

import Foundation

public struct DynamicRoundedDecimal {
    
    private let value: Decimal
    private let scale: Int16
    
    public init(value: Decimal, scale: Int16) {
        
        let decimalHandler = NSDecimalNumberHandler(roundingMode: .bankers,
                                                    scale: scale,
                                                    raiseOnExactness: false,
                                                    raiseOnOverflow: false,
                                                    raiseOnUnderflow: false,
                                                    raiseOnDivideByZero: false)
        
        self.value = value.rounding(accordingToBehavior: decimalHandler)
        self.scale = scale
    }
    
    public init(stringLiteral: String, scale: Int16) {
        
        let decimalValue = Decimal(string: stringLiteral) ?? .nan
        
        self.init(value: decimalValue, scale: scale)
    }
    
    public init(roundedDecimal: DynamicRoundedDecimal, scale: Int16) {
        
        self.init(value: roundedDecimal.value, scale: scale)
    }
    
    public init<T: DecimalPlaces>(roundedDecimal: RoundedDecimal<T>, scale: Int16) {
        
        self.init(value: roundedDecimal.value, scale: T.count)
    }
    
    public func with(scale: Int16) -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: value, scale: scale)
    }
    
    public var isNaN: Bool {
        
        return value.isNaN
    }
    
    public func withInferredPrecision<NewDecimalPlaces: DecimalPlaces>() -> RoundedDecimal<NewDecimalPlaces> {
        
        return RoundedDecimal<NewDecimalPlaces>(value: value)
    }
    
    public func negated() -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: -value, scale: scale)
    }
    
    public func format(with numberFormatter: NumberFormatter) -> String {
        
        return numberFormatter.string(from: value as NSNumber)!
    }
    
    public static func / (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: lhs.value / rhs.value, scale: max(lhs.scale, rhs.scale))
    }
    
    public static func / (numerator: DynamicRoundedDecimal, denominator: Decimal) -> DynamicRoundedDecimal {

        return DynamicRoundedDecimal(value: numerator.value / denominator, scale: numerator.scale)
    }
    
    public static func / (numerator: Decimal, denominator: DynamicRoundedDecimal) -> DynamicRoundedDecimal {

        return DynamicRoundedDecimal(value: numerator / denominator.value, scale: denominator.scale)
    }
    
    public static func * (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: lhs.value * rhs.value, scale: max(lhs.scale, rhs.scale))
    }
    
    public static func * (roundedDecimal: DynamicRoundedDecimal, coefficient: Decimal) -> DynamicRoundedDecimal {

        return DynamicRoundedDecimal(value: roundedDecimal.value * coefficient, scale: roundedDecimal.scale)
    }
    
    public static func * (coefficient: Decimal, roundedDecimal: DynamicRoundedDecimal) -> DynamicRoundedDecimal {

        return DynamicRoundedDecimal(value: roundedDecimal.value * coefficient, scale: roundedDecimal.scale)
    }
    
    public static func + (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: lhs.value + rhs.value, scale: max(lhs.scale, rhs.scale))
    }
    
    public static func - (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> DynamicRoundedDecimal {
        
        return DynamicRoundedDecimal(value: lhs.value - rhs.value, scale: max(lhs.scale, rhs.scale))
    }
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = Int(scale)
        formatter.maximumFractionDigits = Int(scale)
        
        return formatter
    }
}

extension DynamicRoundedDecimal: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: IntegerLiteralType) {
        
        self.init(value: Decimal(value), scale: 0)
    }
}

extension DynamicRoundedDecimal: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return formatter.string(from: value as NSDecimalNumber)!
    }
    
    public var debugDescription: String {
        
        return description
    }
}

extension DynamicRoundedDecimal: Equatable, Hashable, Comparable {
    
    public static func == (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> Bool {
        
        return lhs.value == rhs.value
    }
    
    public static func < (lhs: DynamicRoundedDecimal, rhs: DynamicRoundedDecimal) -> Bool {
        
        return lhs.value < rhs.value
    }
}
