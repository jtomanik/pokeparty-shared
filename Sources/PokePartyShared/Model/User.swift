//
//  User.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

public typealias Base64String = String

import Foundation

public struct User {
    public let id: String
    public var username: String?
    public var team: Team?
    public var level: Int
    public var pokemons: [Pokemon]
    public var avatarUrl: String?
    public var party: Party?

    public var notificationId: Base64String?

    public init(id: String, username: String? = nil, team: Team? = nil, level: Int = 1, pokemons: [Pokemon] = [], avatarUrl: String? = nil, party: Party? = nil, notificationId: Base64String? = nil) {
        self.id = id
        self.username = username
        self.team = team
        self.level = level
        self.pokemons = pokemons
        self.avatarUrl = avatarUrl
        self.party = party
        self.notificationId = notificationId
    }
}
