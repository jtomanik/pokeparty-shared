//
//  PokemonAdapter.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
    import SwiftyJSON
#endif

public struct UserAdapter: ParserDecoderType {

    public typealias Parsable = User
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType) -> Parsable? {
        //Log.debug(raw.description)
        if let id = raw["id"].string {
            let username = raw["username"].string
            return User(id: id, username: username)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension UserAdapter: ParserEncoderType {

    public static func encode(model model: Parsable) -> ParsedType? {
        var dictionary = [String: Int]()
        #if os(Linux)
            var json = JSON(dictionary as Any)
        #else
            var json = JSON(dictionary as AnyObject)
        #endif

        json["id"].string = model.id
        json["username"].string = model.username

        return json
    }
}