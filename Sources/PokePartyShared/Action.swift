//
//  Action.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public protocol Action: BackendConfig {

    var method: Method { get }
    var route: String { get }
}

public extension Action {

    var route: String {
        return "/" + self.path
    }

    var method: Method { return .get }
}