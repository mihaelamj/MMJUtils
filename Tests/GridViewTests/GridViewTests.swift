//
//  GridViewTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import XCTest
@testable import GridView

final class GridViewTests: XCTestCase {
  
  func testDrawGrid() throws {
    let gridView = GridDrawingView()
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
  }
  
}
