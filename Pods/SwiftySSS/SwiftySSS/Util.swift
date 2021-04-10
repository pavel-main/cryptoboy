import Foundation

extension UInt8 {
    var hex:String {
        return "0x" + String(format: "%02x", self)
    }
}

enum DataError : Error {
    case encoding
    case cryptoRandom
    case range(Range<Int>)
    case utfEncoding
}

extension String: Error {}

extension Data {
    static func random(size:Int) throws -> Data {
        var result = [UInt8](repeating: 0, count: size)
        let res = SecRandomCopyBytes(kSecRandomDefault, size, &result)
        
        guard res == 0 else {
            throw DataError.cryptoRandom
        }
        
        return Data(result)
    }
    
    func utf8String() throws -> String {
        guard let utf8String = String(data: self, encoding: String.Encoding.utf8) else {
            throw DataError.utfEncoding
        }
        return utf8String
    }
    
    var bytes: [UInt8] {
        return self.toArray(type: UInt8.self)
    }
    
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }
    
    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
    
    public init?(hex: String) {
        
        let len = hex.count / 2
        var data = Data(capacity: len)
        for indexI in 0..<len {
            let indexJ = hex.index(hex.startIndex, offsetBy: indexI * 2)
            let indexK = hex.index(indexJ, offsetBy: 2)
            let bytes = hex[indexJ..<indexK]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
    
    init<T>(fromArray values: [T]) {
        self = values.withUnsafeBytes { Data($0) }
    }
    
    func toArray<T>(type: T.Type) -> [T] where T: ExpressibleByIntegerLiteral {
        var array = Array<T>(repeating: 0, count: self.count/MemoryLayout<T>.stride)
        _ = array.withUnsafeMutableBytes { copyBytes(to: $0) }
        return array
    }
}

