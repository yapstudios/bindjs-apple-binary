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
        .package(url: "https://github.com/exyte/SVGView", from: "1.0.6"),
        .package(url: "https://github.com/warrenm/GLTFKit2", from: "0.5.11")
    ],
    targets: [
        .binaryTarget(
            name: "BindJS",
            url: "https://github.com/user-attachments/files/24442507/BindJS.xcframework.zip",
            checksum: "c5118d4f1c3191f3662e1e950ae3fe91c14e9cc02de925f9cd598b39427fdb50"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "SVGView", package: "SVGView"),
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
