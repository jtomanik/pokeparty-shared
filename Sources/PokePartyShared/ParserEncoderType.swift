//
//  ParserEncoderType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

protocol ParserEncoderType: ParserType {

    static func parse(model model: Parsable) -> PayloadType?
    static func encode(model model: Parsable) -> ParsedType?
}

extension ParserEncoderType where ParsedType == JsonType {

    static func parse(model model: Parsable) -> PayloadType? {
        guard let json = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.json(json)
    }
}

extension ParserEncoderType where ParsedType == DictionaryType {

    static func parse(model model: Parsable) -> PayloadType? {
        guard let dict = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.urlEncoded(dict)
    }
}

extension ParserEncoderType where ParsedType == TextType {

    static func parse(model model: Parsable) -> PayloadType? {
        guard let text = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.text(text)
    }
}
