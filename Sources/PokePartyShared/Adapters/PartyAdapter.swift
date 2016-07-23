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

public struct PartyAdapter: ParserDecoderType {

    public typealias Parsable = Party
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType?) -> Parsable? {
        guard let raw = raw else {
            return nil
        }
        if let name = raw["name"].string,
            let leaderId = raw["leader_id"].string {
            let id = raw["id"].string
            let hash = raw["hash"].string
            let memberIds = raw["members_ids"].array?.flatMap { $0.string } ?? [String]()

            return Party(id: id, hash: hash, name: name, leaderId: leaderId, memberIds: memberIds)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension PartyAdapter: ParserEncoderType {

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
        json["leader_id"].string = model.leaderId
        json["id"].string = model.id
        json["hash"].string = model.hash

        let jsonArray: [JSON] = model.memberIds.flatMap({ JSON($0) })
        for i in 0..<jsonArray.count {
            json["members_ids"][i] = jsonArray[i]
        }
        return json
    }
}
