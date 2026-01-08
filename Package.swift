// swift-tools-version: 5.11

import PackageDescription

let package = Package(
    name: "BindJS",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "BindJS", targets: ["BindJS", "BindJSDependencies"]),
    ],
    dependencies: [
        .package(url: "https://github.com/yapstudios/SVGView.git", from: "1.0.7"),
        .package(url: "https://github.com/warrenm/GLTFKit2", from: "0.5.11")
    ],
    targets: [
        .binaryTarget(
            name: "BindJS",
            url: "https://github.com/yapstudios/bindjs-apple-binary/releases/download/1.0.3/BindJS.xcframework.zip",
            checksum: "43059673d409abfcb67e62ddeb7b27ee0e84e0287ed30b50b1c8f9a99fb0d106"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "SVGViewKit", package: "SVGView"),
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
