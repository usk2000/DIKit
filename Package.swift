// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "DIKit",
  platforms: [
      .macOS(.v10_11), .iOS(.v11), .tvOS(.v9), .watchOS(.v2)
  ],
  products: [
    .library(name: "DIKit", targets: ["DIKit"]),
  ],
  targets: [
    .target(name: "DIKit")
  ],
  swiftLanguageVersions: [.v5]
)
