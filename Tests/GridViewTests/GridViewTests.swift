//
//  GridViewTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import XCTest
import Foundation
@testable import GridProperties
@testable import GridView

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

final class GridViewTests: XCTestCase {
  
  func testDrawGrid() throws {
    let gridView = GridDrawingView(properties: GridProperties.default)
    let size = CGSize(width: 100.0, height: 100.0)
    let gridViewImage = gridView.drawToImage(size: size)
    XCTAssertNotNil(gridViewImage)
    
    let filePath = gridView.saveImageToDocuments(gridViewImage!, fileName: "gridViewImage.bmp")
    XCTAssertNotNil(filePath)
    
    let filePathString = filePath!.path
    debugPrint("filePath = \(filePathString)")
    
    let fileManager = FileManager.default
    let fileExists = fileManager.fileExists(atPath: filePathString)
    XCTAssertTrue(fileExists)
    
    // FIXME: Make SPM work with `Bundle.module` -
    
//    let testImageURL = Bundle.module.url(forResource: "gridViewImage", withExtension: "bmp")
    
//    #if os(iOS) || os(tvOS)
//    let testPlatformImage = UIImage(contentsOf: testImageURL)
//    #endif
//    #if os(OSX)
//    let testPlatformImage = NSImage(contentsOf: testImageURL)
//    #endif
//    let cgImage = testPlatformImage.cgImage
//
//    XCTAssertNotNil(cgImage)
    
  }
  
//  static var bundle: Bundle {
//    #if SWIFT_PACKAGE
//    return Bundle.module
//    #else
//    return Bundle(for: GridViewTests.self)
//    #endif
//  }
  
}

