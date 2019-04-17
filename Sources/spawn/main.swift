import ShellOut

do {
    let a = try shellOut(to: .updateSwiftPackages())
    print(a)
    let b = try shellOut(to: .generateSwiftPackageXcodeProject())
    print(b)
    let c = try shellOut(to: "xed .")
    print(c)
} catch (let error as ShellOutError) {
    print(error.message)
    print(error.output)
}
