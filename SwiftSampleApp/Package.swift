// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSampleApp",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftSampleApp",
            targets: ["SwiftSampleApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Wua4/DynamicFont.git",
                 .branch("main")
                )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftSampleApp",
            dependencies: ["DynamicFont"],
            path: "Sources"
            ),
        .testTarget(
            name: "SwiftSampleAppTests",
            dependencies: ["SwiftSampleApp"],
            path: "Tests"
            )
    ]
)
