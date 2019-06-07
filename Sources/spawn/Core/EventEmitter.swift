//
//  EventEmitter.swift
//  nom
//
//  Created by Vinh Nguyen on 7/6/19.
//

import Foundation

protocol Emittable {
    var data: Data { get }
}

extension Emittable {
    func emits() -> String {
        guard let output = String(data: self.data, encoding: .utf8) else { return "" }
        guard output.hasSuffix("\n") == false else {
            let endIndex = output.index(before: output.endIndex)
            return String(output[..<endIndex])
        }

        return output
    }
}

extension Data: Emittable {
    var data: Data {
        return self
    }
}

extension Pipe: Emittable {
    var data: Data {
        return self.fileHandleForReading.readDataToEndOfFile()
    }
}
