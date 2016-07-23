//
//  Pokemon.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public struct Pokemon {

    public var number: Int
    public var combatPower: Int

    public init(number: Int, combatPower: Int) {
        self.number = number
        self.combatPower = combatPower
    }
}
