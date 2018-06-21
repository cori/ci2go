//
//  Artifact.swift
//  CI2Go
//
//  Created by Atsushi Nagase on 2018/06/17.
//  Copyright © 2018 LittleApps Inc. All rights reserved.
//

import Foundation
import FileKit

struct Artifact: Decodable {
    let path: String
    let prettyPath: String
    let nodeIndex: Int
    let downloadURL: URL

    enum CodingKeys: String, CodingKey {
        case path
        case prettyPath = "pretty_path"
        case nodeIndex = "node_index"
        case downloadURL = "url"
    }

    var pathWithNodeIndex: String {
        return "Container \(nodeIndex)/\(prettyPath)"
    }

    var localPath: Path {
        return Path.userDownloads + "Artifacts/\(downloadURL.host ?? "localhost")/\(downloadURL.path)"
    }

    var progressFilePath: Path {
        return localPath.parent + ".\(localPath.fileName).progress"
    }

    var isInProgress: Bool {
        return progressFilePath.exists
    }

    func unlinkProgressFile() throws {
        try progressFilePath.deleteFile()
    }

    func createProgressFile() throws {
        try progressFilePath.parent.createDirectory(withIntermediateDirectories: true)
        try progressFilePath.createFile()
    }
}

extension Artifact: Equatable {
    static func == (lhs: Artifact, rhs: Artifact) -> Bool {
        return lhs.nodeIndex == rhs.nodeIndex && lhs.path == rhs.path
    }
}

extension Artifact: Comparable {
    static func < (lhs: Artifact, rhs: Artifact) -> Bool {
        if lhs.nodeIndex != rhs.nodeIndex {
            return lhs.nodeIndex < rhs.nodeIndex
        }
        return lhs.path < rhs.path
    }
}
