//
//  EventAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation

public enum EventAction: Action {

    case create
    case join
    case details
    case update

    public static func from(route: String?) -> EventAction? {
        guard let route = route else {
            return nil
        }
        switch route {
        case let r where r.startsWith(prefix: EventAction.create.route):
            return EventAction.create
        case let r where r.startsWith(prefix: EventAction.join.route):
            return EventAction.join
        case let r where r.startsWith(prefix: EventAction.details.route):
            return EventAction.details
        case let r where r.startsWith(prefix: EventAction.update.route):
            return EventAction.update
        default:
            return nil
        }
    }

    public var path: String {
        switch self {
        case .create:
            return PokePartyAction.event.path + "/create"
        case .join:
            return PokePartyAction.event.path + "/join"
        case .details:
            return PokePartyAction.event.path + "/details"
        case .update:
            return PokePartyAction.event.path + "/update"
        }
    }

    public var method: Method {
        switch self {
        case .create:
            // ..create?name=NAME&owner=OWNERID
            // returns Event (with hash property)
            return .get
        case .join:
            // ..join?hash=EVENTHASH
            // returns Event
            return .get
        case .details:
            // ..details?id=EVENTID
            // returns DetailedEvent
            return .get
        case .update:
            // ..update?id=EVENTID
            // returns Event
            return .post
        }
    }
}