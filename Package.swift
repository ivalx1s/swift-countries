// swift-tools-version: 5.7

import PackageDescription


let package = Package(
    name: "swift-countries",
	platforms: [
		.iOS(.v13),
		.watchOS(.v6),
		.macOS(.v10_15)
	],
    products: [
        .library(
            name: "Countries",
            targets: ["Countries"]
		),
    ],
    targets: [
        .target(
            name: "Countries",
            dependencies: [],
			path: "Sources"
		)
    ]
)
