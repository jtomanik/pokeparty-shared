//
//  ParserEncoderType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public protocol ParserEncoderType: ParserType {

    static func parse(model model: Parsable?) -> PayloadType?
    static func encode(model model: Parsable?) -> ParsedType?
}

public extension ParserEncoderType where ParsedType == JsonType {

    static func parse(model model: Parsable?) -> PayloadType? {
        guard let model = model, let json = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.json(json)
    }
}

public extension ParserEncoderType where ParsedType == DictionaryType {

    static func parse(model model: Parsable?) -> PayloadType? {
        guard let model = model, let dict = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.urlEncoded(dict)
    }
}

public extension ParserEncoderType where ParsedType == TextType {

    static func parse(model model: Parsable?) -> PayloadType? {
        guard let model = model, let text = encode(model: model) else {
            //Log.debug(AdapterError.parserEncoderTypeFailedEncoding)
            return nil
        }
        return PayloadType.text(text)
    }
}
