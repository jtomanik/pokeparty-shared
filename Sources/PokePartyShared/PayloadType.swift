//
//  ParsedType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
    import SwiftyJSON
#endif

//// MARK: ParsedBody

public enum PayloadType {
    case json(JSON)
    case urlEncoded([String:String])
    case text(String)
    case raw(NSData)
}