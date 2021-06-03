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
  
  // MARK: -
  // MARK: Properties -
  
  public var options: GridProperties.Options = .all
  public var lineSize: GridProperties.LineSize = .normal
  public var colors: Colors = Colors.`default`
  
  public static let `default` = GridProperties()
  public static let tiny: GridProperties = GridProperties(options: .all, lineSize: .tiny, colors: .`default`)
  public static let small: GridProperties = GridProperties(options: .all, lineSize: .small, colors: .`default`)
  public static let normal: GridProperties = GridProperties(options: .all, lineSize: .normal, colors: .`default`)
  public static let large: GridProperties = GridProperties(options: .all, lineSize: .large, colors: .`default`)
  
  // MARK: -
  // MARK: Init -
  
  public init(options: GridProperties.Options = .all, lineSize: GridProperties.LineSize = .normal, colors: GridProperties.Colors = Colors.`default`) {
    self.options = options
    self.lineSize = lineSize
    self.colors = colors
  }
  
  // MARK: -
  // MARK: Layout Properties -
  
  private(set) public var layoutState = LayoutState.none
  
  // MARK: -
  // MARK: LineSize -
  
  public enum LineSize: String, CaseIterable, Equatable {
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
  
  // MARK: -
  // MARK: Options -
  
  public struct Options: OptionSet, Equatable {
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
  
  // MARK: -
  // MARK: Colors -
  
  public struct Colors: Equatable {
    public var backgroundColor: ColorType = .white
    public var lineColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.2)
    public var topLeftSquareColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.5)
    public var bottomRightSquareColor: ColorType = ColorType(red: 0, green: 0, blue: 0, alpha: 0.5)
    public var diagonalTriangleColor: ColorType = ColorType(red: 0, green: 0, blue: 1, alpha: 0.4)
    public var centerCircleColor: ColorType = ColorType(red: 1, green: 0, blue: 0, alpha: 0.6)
    
    public static let `default` = Colors()
  }
  
  // MARK: -
  // MARK: LayoutState -
  
  public struct LayoutState: OptionSet {
    
    public let rawValue: Int
    public typealias RawValue = Int
    
    public init(rawValue: LayoutState.RawValue) {
        self.rawValue = rawValue
    }

    public static let none = LayoutState([])
    public static let needsLayout = LayoutState(rawValue: 1 << 1)
    public static let needsDisplay = LayoutState(rawValue: 1 << 2)
  }
  
}

// MARK: -
// MARK: Equatable -

extension GridProperties: Equatable {
  public static func == (lhs: GridProperties, rhs: GridProperties) -> Bool {
    return lhs.options == rhs.options &&
      lhs.lineSize == rhs.lineSize &&
      lhs.colors == rhs.colors
  }
}

// MARK: -
// MARK: Layout -

extension GridProperties {
  private func calculateNewLayoutStateWithChangedProperties(_ properties: GridProperties) -> LayoutState {
    var resultLayout: LayoutState = LayoutState.none
    
    if self.colors != properties.colors {
      resultLayout.insert(.needsDisplay)
    }
    
    if self.lineSize != properties.lineSize {
      resultLayout.insert(.needsDisplay)
      resultLayout.insert(.needsLayout)
    }
    
    if self.options != properties.options {
      resultLayout.insert(.needsDisplay)
    }
    return resultLayout
  }
  
  public mutating func updateLayoutStateWith(newProperties: GridProperties) {
    layoutState = calculateNewLayoutStateWithChangedProperties(newProperties)
  }
}
