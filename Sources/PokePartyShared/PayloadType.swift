//
//  ParsedType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import SwiftyJSON
import Foundation

//// MARK: ParsedBody

public enum PayloadType {
    case json(JSON)
    case urlEncoded([String:String])
    case text(String)
    case raw(NSData)
}