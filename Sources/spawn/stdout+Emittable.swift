//
//  ProcessEmittable.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
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
