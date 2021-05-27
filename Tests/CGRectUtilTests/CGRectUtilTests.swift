//
//  CGRectUtilTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation

import XCTest
@testable import CGRectUtil

final class CGRectUtilTests: XCTestCase {

  func testRandomRectAndIntegralCentered() throws {
    let rect = CGRect(x: 0, y: 0, width: 100, height: 235)
    let randomRect = CGRect.random(in: rect)
    XCTAssertNotEqual(randomRect, rect)
    
    let integralCentereRect = CGRect.integralCenteredInRect(innerRect: randomRect, outerRect: rect)
    XCTAssertEqual(integralCentereRect.midX, rect.midX)
    XCTAssertEqual(integralCentereRect.midY, rect.midY)
  }

}
