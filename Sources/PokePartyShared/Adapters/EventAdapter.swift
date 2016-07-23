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

public struct EventAdapter: ParserDecoderType {

    public typealias Parsable = Event
    public typealias ParsedType = JsonType

    public static func decode(raw raw: ParsedType?) -> Parsable? {
        guard let raw = raw else {
            return nil
        }
        if let name = raw["name"].string,
            let ownerId = raw["owner_id"].string {
            let id = raw["id"].string
            let hash = raw["hash"].string
            let memberIds = raw["members_ids"].array?.flatMap { $0.string } ?? [String]()

            return Event(id: id, hash: hash, name: name, ownerId: ownerId, memberIds: memberIds)
        } else {
            //Log.debug(AdapterError.parserFailedDecoding)
            return nil
        }
    }
}

extension EventAdapter: ParserEncoderType {

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
        json["owner_id"].string = model.ownerId
        json["id"].string = model.id
        json["hash"].string = model.hash

        let jsonArray: [JSON] = model.memberIds.flatMap({ JSON($0) })
        for i in 0..<jsonArray.count {
            json["members_ids"][i] = jsonArray[i]
        }
        return json
    }
}