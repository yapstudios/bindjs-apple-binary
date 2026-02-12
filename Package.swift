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
            url: "https://github.com/yapstudios/bindjs-apple-binary/releases/download/1.0.11/BindJS.xcframework.zip",
            checksum: "b983c210fdcc82cb63c12d949e6d1b421e000ec81e1ef4836937c613058fe7e4"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
