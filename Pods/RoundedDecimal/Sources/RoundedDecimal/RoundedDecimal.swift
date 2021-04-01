//
//  RoundedDecimal.swift
//  RoundedDecimal
//
//  Created by Chris Hargreaves on 16/09/2018.
//  Copyright © 2018 Software Engineering Limited. All rights reserved.
//

import Foundation

public struct RoundedDecimal<T: DecimalPlaces> {
    
    typealias Places = T
    
    let value: Decimal
    
    init(value: Decimal) {
        
        let decimalHandler = NSDecimalNumberHandler(roundingMode: .bankers,
                                                    scale: T.count,
                                                    raiseOnExactness: false,
                                                    raiseOnOverflow: false,
                                                    raiseOnUnderflow: false,
                                                    raiseOnDivideByZero: false)
        
        self.value = value.rounding(accordingToBehavior: decimalHandler)
    }
    
    public var isNaN: Bool {
        
        return value.isNaN
    }
    
    public func withInferredPrecision<NewDecimalPlaces: DecimalPlaces>() -> RoundedDecimal<NewDecimalPlaces> {
        
        return RoundedDecimal<NewDecimalPlaces>(value: value)
    }
    
    public func negated() -> RoundedDecimal {
        
        return RoundedDecimal(value: -value)
    }
    
    public func format(with numberFormatter: NumberFormatter) -> String {
        
        return numberFormatter.string(from: value as NSNumber)!
    }
    
    public static func / (lhs: RoundedDecimal, rhs: RoundedDecimal) -> RoundedDecimal {
        
        return RoundedDecimal(value: lhs.value / rhs.value)
    }
    
    public static func / (numerator: RoundedDecimal, denominator: Decimal) -> RoundedDecimal {

        return RoundedDecimal(value: numerator.value / denominator)
    }
    
    public static func / (numerator: Decimal, denominator: RoundedDecimal) -> RoundedDecimal {

        return RoundedDecimal(value: numerator / denominator.value)
    }
    
    public static func * (lhs: RoundedDecimal, rhs: RoundedDecimal) -> RoundedDecimal {
        
        return RoundedDecimal(value: lhs.value * rhs.value)
    }
    
    public static func * (roundedDecimal: RoundedDecimal, coefficient: Decimal) -> RoundedDecimal {

        return RoundedDecimal(value: roundedDecimal.value * coefficient)
    }
    
    public static func * (coefficient: Decimal, roundedDecimal: RoundedDecimal) -> RoundedDecimal {

        return RoundedDecimal(value: roundedDecimal.value * coefficient)
    }
    
    public static func + (lhs: RoundedDecimal, rhs: RoundedDecimal) -> RoundedDecimal {
        
        return RoundedDecimal(value: lhs.value + rhs.value)
    }
    
    public static func - (lhs: RoundedDecimal, rhs: RoundedDecimal) -> RoundedDecimal {
        
        return RoundedDecimal(value: lhs.value - rhs.value)
    }
    
    public static func nan() -> RoundedDecimal {
        
        return RoundedDecimal(value: .nan)
    }
    
    private let formatter = { () -> NumberFormatter in
        
        let formatter = NumberFormatter()
        
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = Int(T.count)
        formatter.maximumFractionDigits = Int(T.count)
        
        return formatter
    }()
}

extension RoundedDecimal: ExpressibleByStringLiteral {
    
    public init(stringLiteral: String) {
        
        let decimalValue = Decimal(string: stringLiteral) ?? .nan
        
        self.init(value: decimalValue)
    }
}

extension RoundedDecimal: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: IntegerLiteralType) {
        
        self.init(value: Decimal(value))
    }
}

extension RoundedDecimal: Codable {
    
    enum CodingKeys: String, CodingKey {
        
        case value
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        let stringRepresentation = try container.decode(String.self)
        
        self.init(stringLiteral: stringRepresentation)
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.singleValueContainer()
        
        try container.encode(description)
    }
}

extension RoundedDecimal: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        
        return formatter.string(from: value as NSDecimalNumber)!
    }
    
    public var debugDescription: String {
        
        return description
    }
}

extension RoundedDecimal: Equatable, Hashable, Comparable {
    
    public static func == (lhs: RoundedDecimal, rhs: RoundedDecimal) -> Bool {
        
        return lhs.value == rhs.value
    }
    
    public static func < (lhs: RoundedDecimal, rhs: RoundedDecimal) -> Bool {
        
        return lhs.value < rhs.value
    }
}
