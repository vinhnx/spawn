import Foundation

// reference:
// + https://github.com/pixyzehn/Snippet/blob/master/Sources/SnippetCore/Snippet%2BExtensions.swift
// + https://github.com/JohnSundell/ShellOut/blob/master/Sources/ShellOut.swift
// TODO: reference https://github.com/apple/swift-package-manager/tree/master/Examples/package-info

do {
    let files = try FileManager.fileURLs()
    try files.contains(file: "Package.swift")

    let update = try Process().launchBash("swift package update")
    print("📦 ... running '\(update)'")
    let generateProject = try Process().launchBash("swift package generate-xcodeproj")
    print("🛠 ... running '\(generateProject)'")

    try Process().launchBash("xed .")
    print("📂 ... opening updated Xcode project")
    print("✅ all done!")
} catch let error {
    print(error)
}
