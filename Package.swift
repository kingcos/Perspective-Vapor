// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Perspective-Vapor",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0"),
        
        // SwiftSoup
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "1.7.2"),
        
        // GraphQL
        .package(url: "https://github.com/GraphQLSwift/GraphQL.git", from: "0.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "SwiftSoup", "GraphQL"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

