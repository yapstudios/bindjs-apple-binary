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
            url: "https://github.com/yapstudios/bindjs-apple-binary/releases/download/1.0.4/BindJS.xcframework.zip",
            checksum: "1f8489c113fbabdecbcfb19b5a12c93db0751c078b630542e25e68bc725e5020"
        ),
        .target(name: "BindJSDependencies", dependencies: [
            .product(name: "SVGViewKit", package: "SVGView"),
            .product(name: "GLTFKit2", package: "GLTFKit2")
        ]),
    ]
)
