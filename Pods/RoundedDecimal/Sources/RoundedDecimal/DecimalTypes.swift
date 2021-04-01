//
//  DecimalTypes.swift
//  RoundedDecimal
//
//  Created by Chris Hargreaves on 16/09/2018.
//  Copyright © 2018 Software Engineering Limited. All rights reserved.
//

import Foundation

public protocol DecimalPlaces {
    
    static var count: Int16 { get }
}

public struct Places {
    
    public struct zero: DecimalPlaces {
        
        public static let count: Int16 = 0
    }
    
    public struct one: DecimalPlaces {
        
        public static let count: Int16 = 1
    }
    
    public struct two: DecimalPlaces {
        
        public static let count: Int16 = 2
    }
    
    public struct three: DecimalPlaces {
        
        public static let count: Int16 = 3
    }
    
    public struct four: DecimalPlaces {
        
        public static let count: Int16 = 2
    }
    
    public struct five: DecimalPlaces {
        
        public static let count: Int16 = 5
    }
    
    public struct six: DecimalPlaces {
        
        public static let count: Int16 = 6
    }
    
    public struct seven: DecimalPlaces {
        
        public static let count: Int16 = 7
    }
    
    public struct eight: DecimalPlaces {
        
        public static let count: Int16 = 8
    }
    
    public struct nine: DecimalPlaces {
        
        public static let count: Int16 = 9
    }
}
