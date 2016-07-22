//
//  SignupAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

enum SignupAction: Action {

    case googleAuth
    case userSetup

    static func from(route: String?) -> SignupAction? {
        guard let route = route else {
            return nil
        }
        switch route {
        case let r where r.startsWith(prefix: SignupAction.googleAuth.route):
            return SignupAction.googleAuth
        case let r where r.startsWith(prefix: SignupAction.userSetup.route):
            return SignupAction.userSetup
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