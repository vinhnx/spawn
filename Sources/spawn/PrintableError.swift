//
//  PrintableError.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
//

import Foundation

protocol PrintableError: Error, CustomStringConvertible {
    var message: String { get }
}

extension PrintableError {
    var description: String {
        return "> [ERROR] \(self.message)"
    }
}
