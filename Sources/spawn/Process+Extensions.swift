//
//  Process+Extensions.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
//

import Foundation

public extension Process {
    @discardableResult func launchBash(_ command: String) throws -> String {
        self.launchPath = "/bin/bash"
        self.arguments = ["-c", command]

        let outPipe = Pipe()
        self.standardOutput = outPipe
        let errorPipe = Pipe()
        self.standardError = errorPipe

        self.launch()
        self.waitUntilExit()

        switch terminationStatus {
        case 0:
            return outPipe.emits()

        default:
            throw ProcessError(terminationStatus: terminationStatus, errorData: errorPipe.data, outputData: outPipe.data)
        }
    }
}
