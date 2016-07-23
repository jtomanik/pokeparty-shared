//
//  ParserDecoderType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
    import SwiftyJSON
#endif

public protocol ParserDecoderType: ParserType {

    static func parse(body body: PayloadType?) -> Parsable?
    static func decode(raw raw: ParsedType?) -> Parsable?
}

public extension ParserDecoderType where ParsedType == JsonType {

    static func parse(body body: PayloadType?) -> Parsable? {
        guard let body = body else {
            //Log.error(AdapterError.parserDecoderTypeNilBody)
            return nil
        }
        switch body {
        case .json(let json):
            return decode(raw: json)
        case .urlEncoded(let dict):
            #if os(Linux)
                return decode(raw: JSON(dict as Any))
            #else
                return decode(raw: JSON(dict as AnyObject))
            #endif
        default:
            //Log.debug(AdapterError.parserDecoderTypeUnsupportedBodyType)
            return nil
        }
    }
}

public extension ParserDecoderType where ParsedType == DictionaryType {

    static func parse(body body: PayloadType?) -> Parsable? {
        guard let body = body else {
            //Log.error(AdapterError.parserDecoderTypeNilBody.description)
            return nil
        }
        switch body {
        case .urlEncoded(let dict):
            return decode(raw: dict)
        default:
            //Log.debug(AdapterError.parserDecoderTypeUnsupportedBodyType)
            return nil
        }
    }
}

public extension ParserDecoderType where ParsedType == TextType {

    static func parse(body: PayloadType?) -> Parsable? {
        guard let body = body else {
            return nil
        }
        switch body {
        case .text(let text):
            return decode(raw: text)
        default:
            //Log.debug(AdapterError.parserDecoderTypeUnsupportedBodyType)
            return nil
        }
    }
}
