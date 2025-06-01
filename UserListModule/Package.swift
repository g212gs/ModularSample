// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserListModule",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UserListModule",
            targets: ["UserListModule"]),
    ],
    dependencies: [
        .package(path: "../CoreModule"),
        .package(path: "../NetworkModule"),
        .package(path: "../UserDetailModule"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.3.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UserListModule",
            dependencies: [
                "CoreModule",
                "NetworkModule",
                "UserDetailModule",
                .product(name: "Kingfisher", package: "Kingfisher")
            ]
        ),
        .testTarget(
            name: "UserListModuleTests",
            dependencies: ["UserListModule"]
        ),
    ]
)
