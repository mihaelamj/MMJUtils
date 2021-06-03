//
//  CenteredGridViewTests.swift
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

final class CenteredGridViewTests: XCTestCase {
  
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
  
  func test_CenteredGridView_Layout_IsCalled_When_Changing_GridProperties() {
    
    class TestCenteredGridView: CenteredGridView {
      public var didCallLayout = false
      #if os(iOS) || os(tvOS)
      public override func layoutSubviews() {
        super.layoutSubviews()
        didCallLayout = true
      }
      #endif
      #if os(OSX)
      public override func layout() {
        super.layout()
        didCallLayout = true
      }
      #endif
    }
    
    let testCenteredGridView = TestCenteredGridView()
    XCTAssertEqual(testCenteredGridView.gridLayoutState, .none)
   
    // INFO: Change view's `properties`
    testCenteredGridView.properties = GridProperties.tiny
    debugPrint("testCenteredGridView.layoutState", testCenteredGridView.gridLayoutState.toString())
    
    #if os(OSX)
    XCTAssertTrue(testCenteredGridView.needsLayout)
    #endif
    
    XCTAssertEqual(testCenteredGridView.gridLayoutState, [.needsLayout, .needsDisplay])
    
    #if os(iOS) || os(tvOS)
    testCenteredGridView.layoutIfNeeded()
    XCTAssertTrue(testCenteredGridView.didCallLayout)
    #endif
    
    #if os(OSX)
    testCenteredGridView.layout()
    XCTAssertTrue(testCenteredGridView.needsLayout)
    #endif
  }
  
  func testGridDrawingView() {
    
  }
  
}

