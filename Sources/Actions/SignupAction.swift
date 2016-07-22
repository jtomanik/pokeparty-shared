//
//  SignupAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation
import SwiftyJSON

enum SignupAction: Action, URLType {

    case googleAuth
    case userSetup

    static func from(route: String?) -> PokePartyAction? {
        guard let route = route else {
            return nil
        }
        switch route {
        case let r where r.startsWith(prefix: PokePartyAction.googleAuth.route):
            return PokePartyAction.googleAuth
        case let r where r.startsWith(prefix: PokePartyAction.userSetup.route):
            return PokePartyAction.userSetup
        default:
            return nil
        }
    }

    var path: String {
        switch self {
        case .googleAuth:
            return "api/v1/signup/auth"
        case .userSetup:
            return "api/v1/signup/setup"
        }
    }

    var method: Method {
        switch self {
        case .googleAuth:
            return .get
        case .userSetup:
            return .post
        }
    }
}