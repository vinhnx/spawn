//
//  FileError.swift
//  nom
//
//  Created by Vinh Nguyen on 7/6/19.
//

import Foundation

enum FileError: PrintableError {
    case directoryNotFound(String)
    case fileNotFound(String)
    case failedToQueryDirectory

    var message: String {
        switch self {
        case .directoryNotFound(let directory):
            return "Directory \(directory) not found"
        case .fileNotFound(let filename):
            return "File \(filename) not found"
        case .failedToQueryDirectory:
            return "Failed to query directory"
        }
    }
}
