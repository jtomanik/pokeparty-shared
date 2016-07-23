//
//  Method.swift
//  PokePartyShared
//
//  Created by Jakub Tomanik on 22/07/16.
//
//

import Foundation

public enum Method: String, Equatable {
    case all = "ALL"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case head = "HEAD"
    case delete = "DELETE"
    case options = "OPTIONS"
    case trace = "TRACE"
    case copy = "COPY"
    case lock = "LOCK"
    case mkCol = "MKCOL"
    case move = "MOVE"
    case purge = "PURGE"
    case propFind = "PROPFIND"
    case propPatch = "PROPPATCH"
    case unlock = "UNLOCK"
    case report = "REPORT"
    case mkActivity = "MKACTIVITY"
    case checkout = "CHECKOUT"
    case merge = "MERGE"
    case mSearch = "MSEARCH"
    case notify = "NOTIFY"
    case subscribe = "SUBSCRIBE"
    case unsubscribe = "UNSUBSCRIBE"
    case patch = "PATCH"
    case search = "SEARCH"
    case connect = "CONNECT"
    case error = "ERROR"
    case unknown = "UNKNOWN"

    public init?(string: String) {
        self.init(rawValue: string)
    }
}

public func ==(lhs: Method, rhs: Method) -> Bool {
    switch (lhs, rhs) {
    case (.all, _):
        return true
    case (_, .all):
        return true
    default:
        return lhs.rawValue == rhs.rawValue
    }
}