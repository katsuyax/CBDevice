// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBDevice",
    products: [
        .library(
            name: "CBDevice",
            targets: ["CBDevice"]),
    ],
    targets: [
        .target(
            name: "CBDevice")
    ]
)
