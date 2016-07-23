//
//  User.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public struct User {
    public let id: String
    public let username: String?

    public init(id: String, username: String? = nil) {
        self.id = id
        self.username = username
    }
}
