//
//  GridPropertiesTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 03.06.2021..
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

final class GridPropertiesTests: XCTestCase {
  
  func test_changingColor_should_Include_needsDisplay() {
    let properties1 = GridProperties.`default`
    let newColors = GridProperties.Colors(backgroundColor: .blue, lineColor: .red, topLeftSquareColor: .yellow, bottomRightSquareColor: .gray, diagonalTriangleColor: .black, centerCircleColor: .white)
    let properties2 = GridProperties(options: .basic, lineSize: .small, colors: newColors)
    
    let layoutState = properties1.calculateNewLayoutStateWithChangedProperties(properties2)
    XCTAssertTrue(layoutState.contains(.needsDisplay))
  }
  
  func test_changingLineSize_should_Include_needsDisplay_and_needslayout() {
    let properties1 = GridProperties.`default`
    let properties2 = GridProperties(options: .basic, lineSize: .large, colors: .default)
    
    let layoutState = properties1.calculateNewLayoutStateWithChangedProperties(properties2)
    XCTAssertTrue(layoutState.contains(.needsDisplay))
    XCTAssertTrue(layoutState.contains(.needsLayout))
  }
  
  func test_changingOptions_should_Include_needsDisplay() {
    let properties1 = GridProperties.`default`
    let properties2 = GridProperties(options: .all, lineSize: .large, colors: .default)
    
    let layoutState = properties1.calculateNewLayoutStateWithChangedProperties(properties2)
    XCTAssertTrue(layoutState.contains(.needsDisplay))
  }
}
