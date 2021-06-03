// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MMJUtils",
  platforms: [
    .macOS(.v10_15),
    .iOS(.v13)
  ],
  products: [
    .library(name: "CollectionUtil", targets: ["CollectionUtil"]),
    .library(name: "FloatingPointUtil", targets: ["FloatingPointUtil"]),
    .library(name: "CGRectUtil", targets: ["CGRectUtil"]),
    .library(name: "GridProperties", targets: ["GridProperties"]),
    .library(name: "GridView", targets: ["GridView"]),
    .library(name: "GridViewSwiftUI", targets: ["GridViewSwiftUI"]),
  ],
  
  dependencies: [
    .package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.7.0")
  ],
  
  targets: [
    .target(name: "CollectionUtil"),
    .target(name: "FloatingPointUtil"),
    .target(name: "CGRectUtil"),
    .target(name: "GridProperties"),
    .target(name: "GridView", dependencies: ["GridProperties"]),
    .target(name: "GridViewSwiftUI", dependencies: ["GridProperties"]),
    
    .testTarget(name: "CollectionUtilTests", dependencies: ["CollectionUtil"]),
    .testTarget(name: "FloatingPointUtilTests", dependencies: ["FloatingPointUtil"]),
    .testTarget(name: "CGRectUtilTests", dependencies: ["CGRectUtil"]),
    .testTarget(name: "GridPropertiesTests", dependencies: ["GridView", "GridProperties"]),
    .testTarget(name: "GridViewTests", dependencies: ["GridView", "GridProperties"]),//
//    .testTarget(name: "GridDrawingViewTests", dependencies: ["GridView", "GridProperties"]),
    .testTarget(name: "GridViewSwiftUITests", dependencies: ["GridViewSwiftUI", "GridProperties", "ViewInspector"])
  ]
)
