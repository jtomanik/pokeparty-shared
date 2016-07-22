//
//  ParserType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

typealias JsonType = JSON
typealias DictionaryType = [String: String]
typealias TextType = String

protocol ParserType {

    associatedtype Parsable
    associatedtype ParsedType
}
