//
//  CollectionChange.swift
//  CI2Go
//
//  Created by Atsushi Nagase on 2018/06/17.
//  Copyright © 2018 LittleApps Inc. All rights reserved.
//

import Foundation

enum CollectionChange {
    case insertRows([IndexPath])
    case updateRows([IndexPath])
    case insertSections(IndexSet)
}

extension CollectionChange: Equatable {
    static func == (lhs: CollectionChange, rhs: CollectionChange) -> Bool {
        switch (lhs, rhs) {
        case let (.insertRows(l), .insertRows(r)):
            return l == r
        case let (.updateRows(l), .updateRows(r)):
            return l == r
        case let (.insertSections(l), .insertSections(r)):
            return l == r
        default:
            return false
        }
    }
}

extension CollectionChange: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case let .insertRows(indexPaths):
            return "insertRows \(indexPaths)"
        case let .updateRows(indexPaths):
            return "updateRows \(indexPaths)"
        case let .insertSections(sections):
            return "insertSections \(sections)"
        }
    }
}

typealias CollectionChanges = [CollectionChange]
