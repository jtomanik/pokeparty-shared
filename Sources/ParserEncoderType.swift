//
//  ParserEncoderType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
import SwiftyJSON

protocol ParserEncoderType: ParserType {

    static func parse(model: Parsable) -> PayloadType?
    static func encode(model: Parsable) -> ParsedType?
}

extension ParserEncoderType where ParsedType == JsonType {

    static func parse(model: Parsable) -> PayloadType? {
        guard let json = encode(model: model) else {
            Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return ParsedBody.json(json)
    }
}

extension ParserEncoderType where ParsedType == DictionaryType {

    static func parse(model: Parsable) -> PayloadType? {
        guard let dict = encode(model: model) else {
            Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return ParsedBody.urlEncoded(dict)
    }
}

extension ParserEncoderType where ParsedType == TextType {

    static func parse(model: Parsable) -> PayloadType? {
        guard let text = encode(model: model) else {
            Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return ParsedBody.text(text)
    }
}
