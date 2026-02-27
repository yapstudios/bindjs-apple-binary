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
        // GLTFKit2 is a binary framework that must be provided separately
        // (SVGViewKit is statically linked into BindJS.framework, so not needed here)
        .package(url: "https://github.com/warrenm/GLTFKit2", exact: "0.5.14")
    ],
    targets: [
        .binaryTarget(
            name: "BindJS",
            url: "https://github.com/yapstudios/bindjs-apple-binary/releases/download/1.0.14/BindJS.xcframework.zip",
            checksum: "6a92fdaa79f537e81f014688709dddfe594de7a6123319f217dfa679d613ef15"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
