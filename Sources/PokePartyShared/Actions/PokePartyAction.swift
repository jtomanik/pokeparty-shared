//
//  PokePartyAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public enum PokePartyAction: Action {

    case signup

    public static func from(route: String?) -> PokePartyAction? {
        guard let route = route else {
            return nil
        }
        switch route {
        case let r where r.startsWith(prefix: PokePartyAction.signup.route):
            return PokePartyAction.signup
        default:
            return nil
        }
    }

    public var path: String {
        switch self {
        case .signup:
            return "api/v1/signup"
        }
    }
}
