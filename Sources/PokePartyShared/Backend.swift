//
//  Backend.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

protocol BackendConfig: URLType {

    var host: String { get }
}

extension BackendConfig {

    var host: String {
      return "pokeparty.rocks"
    }
}