//
//  FireManager+Extensions.swift
//  nom
//
//  Created by Vinh Nguyen on 7/6/19.
//

import Foundation

extension FileManager {
    static func fileURLs(at path: String = ".") throws -> [URL] {
        let pathURL = URL(string: path)!
        guard let enumerator = FileManager.default.enumerator(at: pathURL,
                                                              includingPropertiesForKeys: nil,
                                                              options: [.skipsHiddenFiles],
                                                              errorHandler: nil) else {
            throw FileError.directoryNotFound(path)
        }

        guard let files = enumerator.allObjects as? [URL] else {
            throw FileError.failedToQueryDirectory
        }

        return files
    }
}

extension Sequence where Element == URL {
    @discardableResult
    func contains(file name: String) throws -> Bool {
        let isPackageManifestFileExists = self.first { $0.lastPathComponent == name } != nil
        guard isPackageManifestFileExists else {
            throw FileError.fileNotFound(name)
        }

        return isPackageManifestFileExists
    }
}
