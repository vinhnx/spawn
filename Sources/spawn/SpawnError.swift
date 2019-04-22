//
//  Error.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
//

import Foundation

enum SpawnError: PrintableError {
    case directoryNotFound(String)
    case failedToQueryDirectory
    case swiftPackageManifestNotFound

    var message: String {
        switch self {
        case .directoryNotFound(let directory):
            return "Directory \(directory) not found"
        case .failedToQueryDirectory:
            return "Failed to query directory"
        case .swiftPackageManifestNotFound:
            return "Swift Package manifest file (Package.swift) not found"
        }
    }
}
