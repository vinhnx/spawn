//
//  PrintableError.swift
//  nom
//
//  Created by Vinh Nguyen on 7/6/19.
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
