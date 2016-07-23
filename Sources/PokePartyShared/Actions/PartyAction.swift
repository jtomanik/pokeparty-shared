//
//  PartyAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation

public enum PartyAction: Action {

    case create
    case join
    case details
    case update

    public static func from(route: String?) -> PartyAction? {
        guard let route = route else {
            return nil
        }
        switch route {
        case let r where r.startsWith(prefix: PartyAction.create.route):
            return PartyAction.create
        case let r where r.startsWith(prefix: PartyAction.join.route):
            return PartyAction.join
        case let r where r.startsWith(prefix: PartyAction.details.route):
            return PartyAction.details
        case let r where r.startsWith(prefix: PartyAction.update.route):
            return PartyAction.update
        default:
            return nil
        }
    }

    public var path: String {
        switch self {
        case .create:
            return PokePartyAction.signup.path + "/create"
        case .join:
            return PokePartyAction.signup.path + "/join"
        case .details:
            return PokePartyAction.signup.path + "/details"
        case .update:
            return PokePartyAction.signup.path + "/update"
        }
    }

    public var method: Method {
        switch self {
        case .create:
            // ..create?name=NAME&owner=LEADERID
            // returns Party (with hash property)
            return .get
        case .join:
            // ..join?hash=HASH
            // returns PARTY
            return .get
        case .details:
            // ..details?id=PARTYID
            // returns DetailedParty
            return .get
        case .update:
            // ..update?id=PARTYID
            // returns PARTY
            return .post
        }
    }
}