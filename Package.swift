import PackageDescription

var package = Package(
    name: "PokePartyShared"
)

#if os(Linux)
  package.dependencies.append([.Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 9)])
#endif