//
//  Party.swift
//  PokePartyShared
//
//  Created by Jaroslaw Gliwinski on 2016-07-22.
//
//

import Foundation


public struct Party {

    public var id: String?
    public var hash: String?
    public let name: String
    public let leaderId: String
    public var memberIds: [String]

    public init(id: String? = nil, hash: String? = nil, name: String, leaderId: String, memberIds:[String] = [String]()) {
        self.id = id
        self.hash = hash
        self.name = name
        self.leaderId = leaderId
        self.memberIds = memberIds
    }
}


public struct DetailedParty {
    
    public var id: String?
    public var hash: String?
    public let name: String
    public let leader: User
    public var members: [User]

    public init(id: String? = nil, hash: String? = nil, name: String, leader: User, members: [User] = [User]()) {
        self.id = id
        self.hash = hash
        self.name = name
        self.leader = leader
        self.members = members
    }

    public var party: Party {
        return Party(id: self.id, hash: self.hash, name: self.name, leaderId: self.leader.id, memberIds: self.members.map({ $0.id }))
    }
}
