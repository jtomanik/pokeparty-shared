//
//  Event.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 23/07/16.
//
//

import Foundation

public struct Event {

    public var id: String?
    public var hash: String?
    public let name: String
    public let ownerId: String
    public var memberIds: [String]

    public init(id: String? = nil, hash: String? = nil, name: String, ownerId: String, memberIds: [String] = [String]()) {
        self.id = id
        self.hash = hash
        self.name = name
        self.ownerId = ownerId
        self.memberIds = memberIds
    }
}


public struct DetailedEvent {

    public var id: String?
    public var hash: String?
    public let name: String
    public let owner: User
    public var members: [User]

    public init(id: String? = nil, hash: String?, name: String, owner: User, members: [User] = [User]()) {
        self.id = id
        self.hash = hash
        self.name = name
        self.owner = owner
        self.members = members
    }

    public var event: Event {
        return Event(id: self.id, hash: self.hash, name: self.name, ownerId: self.owner.id, memberIds: self.members.map({ $0.id }))
    }
}