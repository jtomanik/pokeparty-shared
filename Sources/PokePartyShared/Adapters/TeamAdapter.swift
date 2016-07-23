//
//  TeamAdapter.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
    import SwiftyJSON
#endif

public struct TeamAdapter: ParserDecoderType {

    public typealias Parsable = Team
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType?) -> Parsable? {
        guard let raw = raw else {
            return nil
        }
        //Log.debug(raw.description)
        if let no = raw["name"].int {
            return Team(rawValue: no)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension TeamAdapter: ParserEncoderType {

    public static func encode(model model: Parsable?) -> ParsedType? {
        guard let model = model else {
            return nil
        }
        var dictionary = [String: Int]()
        #if os(Linux)
            var json = JSON(dictionary as Any)
        #else
            var json = JSON(dictionary as AnyObject)
        #endif

        json["name"].int = model.rawValue

        return json
    }
}
