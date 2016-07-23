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

public var notificationId: Base64String?

public struct UserAdapter: ParserDecoderType {

    public typealias Parsable = User
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType?) -> Parsable? {
        guard let raw = raw else {
            return nil
        }
        if let id = raw["id"].string {
            let username = raw["username"].string
            let team: Team? = TeamAdapter.decode(raw: raw["team"])
            let level = raw["level"].int ?? 0
            let pokeArray = raw["pokemons"].array
            let pokemons: [Pokemon] = pokeArray?.flatMap({ PokemonAdapter.decode(raw: $0) }) ?? [Pokemon]()
            let avatarUrl = raw["avatar_url"].string
            let party = PartyAdapter.decode(raw: raw["party"])
            return User(id: id, username: username, team: team, level: level, pokemons: pokemons, avatarUrl: avatarUrl, party: party, notificationId: nil)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension UserAdapter: ParserEncoderType {

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

        json["id"].string = model.id
        json["username"].string = model.username
        json["team"] = TeamAdapter.encode(model: model.team) ?? JSON.null
        json["level"].int = model.level

        #if os(Linux)
            json["pokemons"].arrayObject = [Any]()
        #else
            json["pokemons"].arrayObject = [AnyObject]()
        #endif

        for i in 0..<model.pokemons.count {
            if let jsonString = PokemonAdapter.encode(model: model.pokemons[i])?.description {
                #if os(Linux)
                    var member = jsonString as Any
                #else
                    var member = jsonString as AnyObject
                #endif
                json["pokemons"].arrayObject?.append(member)
            }
        }

        json["avatar_url"].string = model.avatarUrl
        json["party"] = PartyAdapter.encode(model: model.party) ?? JSON.null

        return json
    }
}