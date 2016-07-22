//
//  Action.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

protocol Action {

    var method: Method { get }
    var route: String { get }
}

extension HandlerAction {

    var route: String {
        return "/" + self.path
    }

    var method: Method { return .get }
}