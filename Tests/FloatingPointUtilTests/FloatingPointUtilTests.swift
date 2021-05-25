//
//  FloatingPointUtilTests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 25.05.2021..
//

import XCTest
@testable import FloatingPointUtil

final class FloatingPointUtilTests: XCTestCase {

  func testRoindTo10() throws {
    let value = 325.0
    
    let rounded1 = value.rounded(to: 10)
    XCTAssertEqual(rounded1, 330)
    
    let rounded2 = value.rounded(to: 10, roundingRule: .down)
    XCTAssertEqual(rounded2, 320)
  }
  
  func testRoindTo5() throws {
    let value = 324.0
    
    let rounded1 = value.rounded(to: 5)
    XCTAssertEqual(rounded1, 325)
    
    let rounded2 = value.rounded(to: 5, roundingRule: .down)
    XCTAssertEqual(rounded2, 320)
  }
  
}
