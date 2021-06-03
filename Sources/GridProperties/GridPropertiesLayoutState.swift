//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 03.06.2021..
//

import Foundation

public extension GridProperties {
  // MARK: -
  // MARK: LayoutState -
  
  struct LayoutState: OptionSet {
    
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
// MARK: Layout -

public extension GridProperties {
  func calculateNewLayoutStateWithChangedProperties(_ properties: GridProperties) -> LayoutState {
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
}

// MARK: -
// MARK: Helper -

public extension GridProperties.LayoutState {
  func toString() -> String {
    var values = [String]()
    
    if self.contains(.needsDisplay) {
      values.append(".needsDisplay")
    }
    if self.contains(.needsLayout) {
      values.append(".needsLayout")
    }
    
    return values.isEmpty ? ".none" : values.joined(separator: ",")
  }
}
