import PackageDescription

let package = Package(
    name: "PokePartyShared",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 9)
    ]
)