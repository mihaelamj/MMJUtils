//
//  GridProperties.swift
//  MMJUtils - GridView
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation
import CoreGraphics

#if os(iOS) || os(tvOS)
import UIKit.UIColor
public typealias ColorType = UIColor
#elseif os(macOS)
import AppKit.NSColor
public typealias ColorType = NSColor
#endif

public struct GridProperties {
  
  public var options: GridProperties.Options = .all
  public var lineSize: GridProperties.LineSize = .normal
  public var colors: Colors = Colors.`default`
  
  public static let `default` = GridProperties()
  public static let tiny: GridProperties = GridProperties(options: .all, lineSize: .tiny, colors: .`default`)
  public static let small: GridProperties = GridProperties(options: .all, lineSize: .small, colors: .`default`)
  public static let normal: GridProperties = GridProperties(options: .all, lineSize: .normal, colors: .`default`)
  public static let large: GridProperties = GridProperties(options: .all, lineSize: .large, colors: .`default`)
  
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
  
  public struct Colors {
    public var backgroundColor: ColorType = .white
    public var lineColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.2)
    public var topLeftSquareColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.5)
    public var bottomRightSquareColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.5)
    public var diagonalTriangleColor: ColorType = ColorType(red: 0, green: 0, blue: 1, alpha: 0.4)
    public var centerCircleColor: ColorType = ColorType(red: 1, green: 0, blue: 0, alpha: 0.6)
    
    public static let `default` = Colors()
  }
  
}
