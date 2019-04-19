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

do {
    print("📦 ... updating packages")
    print(try Process().launchBash("swift package update"))

    print("🛠 ... generate Xcode project")
    print(try Process().launchBash("swift package generate-xcodeproj"))

    print("📂 ... opening updated Xcode project")
    try Process().launchBash("xed .")
    print("✅ all done!")
} catch let error {
    print(error)
}
