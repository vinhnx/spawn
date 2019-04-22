//
//  FileManager+Extensions.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
//

import Foundation

extension FileManager {
    static func fileURLs(at path: String = ".") throws -> [URL] {
        let pathURL = URL(string: path)!
        guard let enumerator = FileManager.default.enumerator(at: pathURL,
                                                              includingPropertiesForKeys: nil,
                                                              options: [.skipsHiddenFiles],
                                                              errorHandler: nil) else {
            throw SpawnError.directoryNotFound(path)
        }

        guard let files = enumerator.allObjects as? [URL] else {
            throw SpawnError.failedToQueryDirectory
        }

        return files
    }
}

extension Sequence where Element == URL {
    @discardableResult
    func contains(file name: String) throws -> Bool {
        let isPackageManifestFileExists = self.first { $0.lastPathComponent == name } != nil
        guard isPackageManifestFileExists else {
            throw SpawnError.swiftPackageManifestNotFound
        }

        return isPackageManifestFileExists
    }
}
