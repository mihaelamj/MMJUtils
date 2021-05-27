//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation
import CoreGraphics

public struct GridProperties {
  
  public enum LineSize: String, CaseIterable {
    case tiny
    case small
    case normal
    case large
    
    public var sideWidth: CGFloat {
      switch self {
        case .tiny:
        return 4.0
        case .small:
          return 10.0
        case .normal:
          return 20.0
        case .large:
          return 30.0
      }
    }
    
    public var lineWidth: CGFloat {
      switch self {
        case .tiny, .small:
          return 1.0
        case .normal:
          return 2.0
        case .large:
          return 3.0
      }
    }
  }
  
  public struct Options: OptionSet {
    public let rawValue: Int
    public typealias RawValue = Int
    
    public init(rawValue: Options.RawValue) {
        self.rawValue = rawValue
    }
    
    public static let hasTopLeftSquare = Options(rawValue: 1 << 0)
    public static let hasBottomRightSquare = Options(rawValue: 1 << 1)
    public static let hasDiagonalTriangle = Options(rawValue: 1 << 2)
    public static let hasDotInTheMiddle = Options(rawValue: 1 << 3)
    
    public static let basic: Options  = [.hasTopLeftSquare]
    public static let `default`: Options  = [.hasTopLeftSquare, .hasDiagonalTriangle]
    public static let all: Options = [.hasTopLeftSquare, .hasBottomRightSquare, .hasDiagonalTriangle, .hasDotInTheMiddle]
  }
}
