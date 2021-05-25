//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 25.05.2021..
//
import XCTest
@testable import CollectionUtil

final class CollectionUtilTests: XCTestCase {
  
  func testExistingElement() throws {
    let array = [1, 2, 3]
    
    let existing0 = array[safe: 0]
    XCTAssertEqual(existing0, 1)
    
    let existing1 = array[safe: 1]
    XCTAssertEqual(existing1, 2)
    
    let existing2 = array[safe: 2]
    XCTAssertEqual(existing2, 3)
  }
  
  func testOverflowReturnsNil() throws {
    let array = [1, 2, 3]
    
    let overflow1 = array[safe: 4]
    XCTAssertNil(overflow1)
    
    let overflow2 = array[safe: -10]
    XCTAssertNil(overflow2)
  }
  
}
