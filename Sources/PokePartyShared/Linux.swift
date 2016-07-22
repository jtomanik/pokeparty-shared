//
//  Linux.swift
//  Slacket
//
//  Created by Jakub Tomanik on 03/06/16.
//
//

import Foundation

// Linux compability helpers, that should not be neccesery in Swift preview 1

#if os(Linux)

public extension Sequence where Iterator.Element == String {
    
    public func joinedBy(separator: String) -> String {
        return self.joined(separator: separator)
    }
}

public extension String {
    
    public func startsWith(prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }

    public func trimWhitespace() -> String {
        return self.trimmingCharacters(in: NSCharacterSet(charactersIn: " "))
    }

    public func withoutPercentEncoding() -> String? {
        #if os(Linux)
            // from https://github.com/apple/swift-corelibs-foundation/tree/d2dc9f3cf91100b752476a72c519a8a629d9df2c/Foundation
            return self.stringByRemovingPercentEncoding
        #else
            return self.removingPercentEncoding
        #endif
    }

    public var encodedData: NSData? {
        return self.data(using: NSUTF8StringEncoding)
    }

    public func replaceOccurrences(of: String, with: String) -> String {
        return self.replacingOccurrences(of: of, with: with)
    }

    public func separatedComponents(separatedBy separator: String) -> [String] {
        return self.components(separatedBy: separator)
    }
    
    public func stringByAddingPercentEncoding() -> String? {
        let characterSet = NSMutableCharacterSet(charactersIn: "_")
        characterSet.formUnion(with: NSCharacterSet.alphanumerics())
        #if os(Linux)
            return self.stringByAddingPercentEncodingWithAllowedCharacters(characterSet)
        #else
            return self.addingPercentEncoding(withAllowedCharacters: characterSet)
        #endif
    }
}

public extension Dictionary {
    public func merge(dict: Dictionary<Key,Value>) -> Dictionary<Key,Value> {
        var mutableCopy = self
        for (key, value) in dict {
            // If both dictionaries have a value for same key, the value of the other dictionary is used.
            mutableCopy[key] = value
        }
        return mutableCopy
    }
}

#else

public extension String {

    public func startsWith(prefix prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }
}

#endif