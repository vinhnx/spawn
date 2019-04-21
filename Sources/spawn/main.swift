import Foundation

// reference:
// + https://github.com/pixyzehn/Snippet/blob/master/Sources/SnippetCore/Snippet%2BExtensions.swift
// + https://github.com/JohnSundell/ShellOut/blob/master/Sources/ShellOut.swift

extension Process {
    @discardableResult func launchBash(_ command: String) throws -> String {
        let outputPipe = Pipe()
        self.standardOutput = outputPipe
        self.launchPath = "/bin/bash"
        self.arguments = ["-c", command]
        self.launch()

        let output = outputPipe.emits() ?? ""
        self.waitUntilExit()
        return output
    }
}

private extension Pipe {
    func emits() -> String? {
        let data = self.fileHandleForReading.readDataToEndOfFile()
        guard let output = String(data: data, encoding: .utf8) else { return nil }
        guard output.hasSuffix("\n") == false else {
            let endIndex = output.index(before: output.endIndex)
            return String(output[..<endIndex])
        }

        return output
    }
}

enum SpawnError: Error, CustomStringConvertible {
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

    var description: String {
        return "[ERROR] \(self.message)"
    }
}

do {
    let currentDir = URL(string: ".")!
    guard let filesEnumerator = FileManager.default.enumerator(at: currentDir, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles], errorHandler: nil) else {
        throw SpawnError.directoryNotFound(".")
    }

    guard let files = filesEnumerator.allObjects as? [URL] else {
        throw SpawnError.failedToQueryDirectory
    }

    let isPackageManifestFileExists = files.first { $0.lastPathComponent == "Package.swift" } != nil
    guard isPackageManifestFileExists else {
        throw SpawnError.swiftPackageManifestNotFound
    }

    print("📦 ... \(try Process().launchBash("swift package update"))")
    print("🛠 ... \(try Process().launchBash("swift package generate-xcodeproj"))")
    print("📂 ... opening updated Xcode project")
    try Process().launchBash("xed .")
    print("✅ all done!")
} catch let error {
    print(error)
}
