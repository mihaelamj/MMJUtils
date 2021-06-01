//
//  GridViewSwiftUITests.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 01.06.2021..
//

import XCTest
import Foundation
@testable import GridProperties
@testable import GridViewSwiftUI

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

import SwiftUI
import ViewInspector

extension GridViewSwiftUI: Inspectable {}

final class GridViewSwiftUITests: XCTestCase {
  
  func testDrawGridSwiftUI_tiny() throws {
    let myView = GridViewSwiftUI(properties: .tiny)
    let actualView = try myView.inspect().actualView()
    XCTAssertEqual(actualView.properties.lineSize, GridProperties.LineSize.tiny)
  }
  
  func testDrawGridSwiftUI_small() throws {
    let myView = GridViewSwiftUI(properties: .small)
    let actualView = try myView.inspect().actualView()
    XCTAssertEqual(actualView.properties.lineSize, GridProperties.LineSize.small)
  }
  
  func testDrawGridSwiftUI_normal() throws {
    let myView = GridViewSwiftUI(properties: .normal)
    let actualView = try myView.inspect().actualView()
    XCTAssertEqual(actualView.properties.lineSize, GridProperties.LineSize.normal)
  }
  
  func testDrawGridSwiftUI_large() throws {
    let myView = GridViewSwiftUI(properties: .large)
    let actualView = try myView.inspect().actualView()
    XCTAssertEqual(actualView.properties.lineSize, GridProperties.LineSize.large)
  }
  
}

