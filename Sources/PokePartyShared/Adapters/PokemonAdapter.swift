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

struct PokemonParser: ParserDecoderType {

    typealias Parsable = Pokemon
    typealias ParsedType = JsonType

    static func decode(raw raw: ParsedType) -> Parsable? {
        //Log.debug(raw.description)
        if let number = raw["number"].int,
            combatPower = raw["combat_power"].int {
            return Pokemon(number: number, combatPower: combatPower)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension PokemonParser: ParserEncoderType {

    static func encode(model model: Parsable) -> ParsedType? {
        var dictionary = [String: Int]()
        dictionary["number"] = model.number
        dictionary["combat_power"] = model.combatPower

        #if os(Linux)
            return JSON(dictionary as Any)
        #else
            return JSON(dictionary as AnyObject)
        #endif
    }
}