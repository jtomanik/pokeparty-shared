//
//  ParserType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
import SwiftyJSON
#endif

public typealias JsonType = JSON
public typealias DictionaryType = [String: String]
public typealias TextType = String

public protocol ParserType {

    associatedtype Parsable
    associatedtype ParsedType
}
