//
//  URLType.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

enum URLSchema: String {
    case http = "http"
    case https = "https"
}

protocol URLType {

    /*
     This protocol abstracts URL,
     naming from RFC 1808, RFC 1738
     in order to provide better transition to NSURL in the future
     this is first revision and is still work in progress.
     */

    var scheme: URLSchema { get }
    var host: String { get }
    var port: Int? { get }
    var path: String { get }

    var baseURL: String { get }
    var absoluteString: String { get }
}

extension URLType {

    var scheme: URLSchema {
        return .http
    }

    var port: Int? {
        return nil
    }

    var path: String {
        return ""
    }

    var baseURL: String {
        var portString = ""
        if let portNum = self.port {
            portString = ":\(portNum)"
        }
        return "\(self.scheme.rawValue)://\(self.host)\(portString)/"
    }

    var absoluteString: String {
        return "\(self.baseURL)\(self.path)"
    }
}