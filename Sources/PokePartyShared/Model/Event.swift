//
//  Event.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation

public struct Event {

    public let id: String?
    public let hash: String?
    public let name: String
    public let ownerId: String
    public let memberIds: [String]

    public init(id: String? = nil, hash: String? = nil, name: String, ownerId: String, memberIds: [String]) {
        self.id = id
        self.hash = hash
        self.name = name
        self.ownerId = ownerId
        self.memberIds = memberIds
    }
}


public struct DetailedEvent {

    public let id: String?
    public let hash: String?
    public let name: String
    public let owner: User
    public let members: [User]

    public init(id: String? = nil, hash: String?, name: String, owner: User, members: [User]) {
        self.id = id
        self.hash = hash
        self.name = name
        self.owner = owner
        self.members = members
    }
}