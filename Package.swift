// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Perspective-Vapor",
    dependencies: [
        // Vapor
        .package(url: "https://github.com/vapor/vapor.git", from: "4.90.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

