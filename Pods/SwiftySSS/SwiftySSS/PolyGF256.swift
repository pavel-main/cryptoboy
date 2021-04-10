import Foundation

class PolyGF256: Equatable, CustomDebugStringConvertible {
    
    var coefficients: [GF256]
    
    var degree: Int {
        return coefficients.count - 1
    }
    
    var length: Int {
        return coefficients.count
    }
    
    init(coefficients: [GF256]) {
        self.coefficients = coefficients
    }
    
    convenience init(bytes: [UInt8]) {
        var theBytes = bytes
        if theBytes.isEmpty {
            theBytes.append(0x00)
        }
        
        self.init(coefficients: [GF256](bytes: bytes))
    }
    
    /// A random polynomial with degree `degree`
    static func random(zeroAt: GF256, degree: Int) throws -> PolyGF256 {
        var coefficients = [GF256]()
        coefficients.append(zeroAt)
        coefficients.append(contentsOf: [GF256](bytes: try Data.random(size: degree).bytes))
        
        // degreeth'th coefficient cannot be zero
        while coefficients[degree] == GF256.zero {
            coefficients[degree] = try GF256(Data.random(size: 1).bytes[0])
        }

        return PolyGF256(coefficients: coefficients)
    }
    
    /// Horner's Method: https://en.wikipedia.org/wiki/Horner%27s_method
    func evaluate(at x:GF256) throws -> GF256 {
        var p:GF256 = GF256.zero
        
        for i in 1...length {
            p = try p*x + coefficients[length - i]
        }
        
        return p
    }
    
    /// Lagrange polynomial interpolation
    static func interpolate(points:[(x: GF256, y: GF256)], at value: GF256) throws -> GF256 {
        
        let n = points.count
        var out = GF256.zero
        
        for i in 0 ..< n {
            let y = points[i].y
            var l = GF256(1)
            
            for j in 0 ..< n {
                guard i != j else {
                    continue
                }
                
                let numer = try value - points[j].x
                let denom = try points[i].x - points[j].x
                
                l = try l * (numer / denom)
            }
            
            out = try out + (y * l)
        }
        
        return out
    }
    
    var debugDescription: String {
        guard length > 0 else {
            return "0"
        }
        
        var out = "\(coefficients[0].byte)"
        
        if length >= 2 {
            out += " + \(coefficients[1].byte)x"
        }
        
        guard length >= 3 else {
            return out
        }
        
        for i in 2 ..< length {
            out += " + \(coefficients[i].byte)x^\(i)"
        }
        return out
    }
}

func ==(p: PolyGF256, q: PolyGF256) -> Bool{
    return true
}
