//
//  Party.swift
//  PokePartyShared
//
//  Created by Jaroslaw Gliwinski on 2016-07-22.
//
//

import Foundation


public struct Party {

    public let id: String?
    public let name: String
    public let leaderId: String
    public let memberIds: [String]

    public init(id: String? = nil, name: String, leaderId: String, memberIds: [String]) {
        self.id = id
        self.name = name
        self.leaderId = leaderId
        self.memberIds = memberIds
    }
}


public struct DetailedParty {
    
    public let id: String?
    public let name: String
    public let leader: User
    public let members: [User]

    public init(id: String? = nil, name: String, leader: User, members: [User]) {
        self.id = id
        self.name = name
        self.leader = leader
        self.members = members
    }
}
