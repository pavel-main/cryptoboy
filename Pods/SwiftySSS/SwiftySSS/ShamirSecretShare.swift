/**
 Shamir's Secret Sharing.
 
 A threshold secret sharing scheme to split data into N secret shares such that
 at least K secret shares must be combined to reconstruct the data.
 
 This is scheme is information-theortic secure; An adversary with K-1
 or fewer secret shares would produce any data with equal probability,
 meaning fewer than K-1 shares reveal nothing about the secret data.
 
 https://en.wikipedia.org/wiki/Shamir%27s_Secret_Sharing
 */

import Foundation

public class Secret {
    
    /**
     The number of secret shares to create (N)
     */
    public let shares: UInt8
    
    /**
     The number of secret shares requried to reconstruct the secret
     */
    public let threshold: UInt8
    
    /**
     The secret data
     */
    public let data: Data
    
    /**
     Secret Sharing Errors
     */
    public enum Errors: Error {
        case unsupportedLength
        case thresholdLargerThanShares
        case thresholdTooLow
        case splitOnZero
        case shareDataLengthMismatch
        case shareDataTooShort
        case invalidStringRepresentation
    }
    
    /**
     An Invidivual Secret Share
     */
    public struct Share: CustomStringConvertible, Hashable {
        
        let point: UInt8
        var bytes: [UInt8]
        
        init(point: UInt8, bytes: [UInt8]) {
            self.point = point
            self.bytes = bytes
        }
        
        public init(data: Data) throws {
            guard data.count >= 1 else {
                throw Errors.shareDataTooShort
            }
            
            let dataBytes = data.bytes
            
            self.point = dataBytes[0]
            self.bytes = [UInt8](dataBytes[1 ..< dataBytes.count])
        }
        
        public init(string: String) throws {

            let components = string.components(separatedBy: "-")

            guard let pointComponent = components.first,
                let point = UInt8(pointComponent)  else {
                throw Errors.invalidStringRepresentation
            }

            guard let bytesComponent = components.last,
                let bytes = Data(hex: bytesComponent)?.bytes  else {
                    throw Errors.invalidStringRepresentation
            }

            self.point = point
            self.bytes = bytes
        }
        
        public init(closure: (Any) throws -> (point: UInt8, bytes: Data), value: Any) throws {
            
            let resultTuple = try closure(value)
            let point = resultTuple.point
            let data = resultTuple.bytes
            
            self.point = point
            self.bytes = data.bytes
        }
        
        public func description(closure: (UInt8, Data) -> String) -> String {
            return closure(point, Data(bytes))
        }
        
        public var data: Data {
            return Data([point] + bytes)
        }
        
        public var description: String {
            return "\(point)-\(Data(bytes).hexEncodedString())"
        }
    }
    
    /**
     Initialize a secret `data` with a `threshold` and the number
     of `shares` to create.
     */
    public init(data: Data, threshold: Int, shares: Int) throws {
        
        guard threshold <= Int(UInt8.max), shares <= Int(UInt8.max)
            else {
                throw Errors.unsupportedLength
        }
        
        guard threshold > 1 else {
            throw Errors.thresholdTooLow
        }
        
        guard threshold <= shares else {
            throw Errors.thresholdLargerThanShares
        }
        
        self.threshold = UInt8(threshold)
        self.shares = UInt8(shares)
        self.data = data
    }
    
    /**
     Split the secret data into `shares` shares
     */
    public func split() throws -> [Share] {
        let bytes = data.bytes
        var secretShares = [Share]()
        
        // initialize the shares
        for x in 1...shares {
            secretShares.append(Share(point: x, bytes: []))
        }
        
        for byte in bytes {
            let poly = try PolyGF256.random(zeroAt: GF256(byte), degree: Int(threshold - 1))
            
            for x in 1...shares {
                let v = try poly.evaluate(at: GF256(x)).byte
                secretShares[Int(x) - 1].bytes.append(v)
            }
        }
        
        return secretShares
    }
    
    /**
     Combine `shares` to reconstruct a secret data
     */
    public static func combine(shares: [Share]) throws -> Data {
        guard shares.count > 0 else {
            return Data()
        }
        
        let dataLength = shares[0].bytes.count
        
        // count the resulting byte length or throw if
        // they mismatch
        try shares.forEach({
            guard $0.bytes.count == dataLength else {
                throw Errors.shareDataLengthMismatch
            }
        })
        
        let uniqueShares = Array(Set(shares))
        
        var combinedBytes = [UInt8]()
        
        for i in 0 ..< dataLength {
            let points = uniqueShares.map({ (GF256($0.point),  GF256($0.bytes[i])) })
            let result = try PolyGF256.interpolate(points: points, at: GF256.zero)
            combinedBytes.append(result.byte)
        }
        
        return Data(combinedBytes)
    }
}
