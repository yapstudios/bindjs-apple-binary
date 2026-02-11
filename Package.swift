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
            url: "https://github.com/yapstudios/bindjs-apple-binary/releases/download/1.0.9/BindJS.xcframework.zip",
            checksum: "ae240f8cc42a1b95ce4b814cd393cbbb6376ee569780a0f030d1922df6eaefc0"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
