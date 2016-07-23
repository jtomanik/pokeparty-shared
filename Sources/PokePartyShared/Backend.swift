//
//  Backend.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public protocol BackendConfig: URLType {

    var host: String { get }
}

public extension BackendConfig {

    var host: String {
      return "104.154.53.1"
    }

    var port: Int? {
        return 8090
    }
}