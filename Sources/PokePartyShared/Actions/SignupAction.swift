//
//  SignupAction.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public enum SignupAction: Action {

    case googleAuth
    case userSetup

    public static func from(route: String?) -> SignupAction? {
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

    public var path: String {
        switch self {
        case .googleAuth:
            return PokePartyAction.signup.path + "/auth"
        case .userSetup:
            return PokePartyAction.signup.path + "/setup"
        }
    }

    public var method: Method {
        switch self {
        case .googleAuth:
            return .get
        case .userSetup:
            return .post
        }
    }
}