// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MMJUtils",
  products: [
    .library(name: "CollectionUtil", targets: ["CollectionUtil"]),
    .library(name: "FloatingPointUtil", targets: ["FloatingPointUtil"]),
    .library(name: "CGRectUtil", targets: ["CGRectUtil"]),
    .library(name: "GridView", targets: ["GridView"]),
  ],
  
  targets: [
    .target(name: "CollectionUtil"),
    .target(name: "FloatingPointUtil"),
    .target(name: "CGRectUtil"),
    .target(name: "GridView"),
    
    .testTarget(name: "CollectionUtilTests", dependencies: ["CollectionUtil"]),
    .testTarget(name: "FloatingPointUtilTests", dependencies: ["FloatingPointUtil"]),
    .testTarget(name: "CGRectUtilTests", dependencies: ["CGRectUtil"]),
    .testTarget(name: "GridViewTests",
                dependencies: ["GridView"]//,
            //    resources: [.copy("Resources/gridViewImage"),]
                )
  ]
)
