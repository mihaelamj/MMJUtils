//
//  GridDrawingViewTests.swift
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

final class GridDrawingViewTests: XCTestCase {
  func testDraw_isCalled_When_Changing_Some_GridViewProperties() {
    
    class GridDrawingViewTest: GridDrawingView {
      public var didCallDraw = false
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
      
      #if os(OSX)
      public override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        didCallDraw = true
      }
      
      override public func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        didCallDraw = true
      }
      #endif

      #if os(iOS) || os(tvOS)
      override public func draw(_ rect: CGRect) {
        super.draw(rect)
        didCallDraw = true
      }
      #endif
    }
    
    let originalProperties = GridProperties.default
    let testView = GridDrawingViewTest(properties: originalProperties)
    testView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    let newColors = GridProperties.Colors(backgroundColor: .blue, lineColor: .red, topLeftSquareColor: .yellow, bottomRightSquareColor: .gray, diagonalTriangleColor: .black, centerCircleColor: .white)
    let properties2 = GridProperties(options: .basic, lineSize: .small, colors: newColors)
    
    testView.properties = properties2
    
    let layoutState = originalProperties.calculateNewLayoutStateWithChangedProperties(properties2)
    XCTAssertTrue(layoutState.contains(.needsDisplay))
    
    #if os(OSX)
    debugPrint("testView.testView.needsToDraw(testView.bounds)= \(testView.needsToDraw(testView.bounds))")
    XCTAssertTrue(testView.needsToDraw(testView.bounds))
    #endif
    
    let properties3 = GridProperties(options: testView.properties.options, lineSize: .large, colors: testView.properties.colors)
    testView.properties = properties3
    
    XCTAssertEqual(testView.layoutState, [.needsLayout, .needsDisplay])
    
    #if os(iOS) || os(tvOS)
    testView.layoutIfNeeded()
    XCTAssertTrue(testView.didCallLayout)
    #endif
    
    #if os(OSX)
    debugPrint("testView.testView.needsToDraw(testView.bounds)= \(testView.needsToDraw(testView.bounds))")
    XCTAssertTrue(testView.needsToDraw(testView.bounds))
    XCTAssertTrue(testView.needsLayout)
    #endif
  }
  
  
}
