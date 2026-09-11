// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "PongoOS-iOS-Emulator",
    platforms: [
        .iOS(.v14)
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PongoOS-iOS-Emulator",
            dependencies: [],
            path: "PongoOS-iOS-Emulator"
        )
    ]
)
