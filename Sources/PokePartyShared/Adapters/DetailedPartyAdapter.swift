//
//  PartyAdapter.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation
#if os(Linux) || os(OSX)
    import SwiftyJSON
#endif

public struct DetailedPartyAdapter: ParserDecoderType {

    public typealias Parsable = DetailedParty
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType?) -> Parsable? {
        guard let raw = raw else {
            return nil
        }
        if let name = raw["name"].string,
            let leader = UserAdapter.decode(raw: raw["leader"]) {
            let id = raw["id"].string
            let hash = raw["hash"].string
            let members = raw["members"].array?.flatMap { UserAdapter.decode(raw: $0) } ?? [User]()

            return DetailedParty(id: id, hash: hash, name: name, leader: leader, members: members)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension DetailedPartyAdapter: ParserEncoderType {

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

        json["name"].string = model.name
        json["leader"] = UserAdapter.encode(model: model.leader) ?? JSON.null
        json["id"].string = model.id
        json["hash"].string = model.hash

        #if os(Linux)
            json["members"].arrayObject = [Any]()
        #else
            json["members"].arrayObject = [AnyObject]()
        #endif

        for i in 0..<model.members.count {
            if let jsonString = UserAdapter.encode(model: model.members[i])?.description {
                #if os(Linux)
                    var member = jsonString as Any
                #else
                    var member = jsonString as AnyObject
                #endif
                json["members"].arrayObject?.append(member)
            }
        }

        return json
    }
}
