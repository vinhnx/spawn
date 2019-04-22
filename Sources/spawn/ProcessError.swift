//
//  ProcessError.swift
//  spawn
//
//  Created by Vinh Nguyen on 22/4/19.
//

import Foundation

struct ProcessError: PrintableError {
    /// The termination status of the command that was run
    public let terminationStatus: Int32
    /// The error message as a UTF8 string, as returned through `STDERR`
    public var message: String { return self.errorData.emits() }
    /// The raw error buffer data, as returned through `STDERR`
    public let errorData: Data
    /// The raw output buffer data, as retuned through `STDOUT`
    public let outputData: Data
    /// The output of the command as a UTF8 string, as returned through `STDOUT`
    public var output: String { return self.outputData.emits() }
}
