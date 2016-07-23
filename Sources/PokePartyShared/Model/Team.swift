//
//  Team.swift
//  PokePartyShared
//
//  Created by Jaroslaw Gliwinski on 2016-07-22.
//
//

import Foundation


public enum Team: Int, CustomStringConvertible {
    case valor
    case mystic
    case instinct

    public var description: String {
        switch self {
        case .valor: return "Valor"
        case .mystic: return "Mystic"
        case .instinct: return "Instinct"
        }
    }
}
