//
//  GridDrawingView.swift
//  MMJUtils - GridView
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

#if os(iOS) || os(tvOS)
import UIKit.UIView
public typealias ViewType = UIView
#elseif os(macOS)
import AppKit.NSView
public typealias ViewType = NSView
#endif

import GridProperties

public class GridDrawingView: ViewType {
  
  // MARK:-
  // MARK: Properties -
  
  internal var _properties: GridProperties = .default
  var properties: GridProperties {
    set(newValue) {
      layoutState = properties.calculateNewLayoutStateWithChangedProperties(newValue)
      _properties = newValue
      
      if layoutState.contains(.needsLayout) {
        #if os(iOS) || os(tvOS)
        setNeedsLayout()
        #endif
        #if os(OSX)
        needsLayout = true
        #endif
      }
      
      if layoutState.contains(.needsDisplay) {
        #if os(iOS) || os(tvOS)
        setNeedsDisplay()
        #endif
        #if os(OSX)
        setNeedsDisplay(bounds)
        #endif
      }
    }

    get {
      return _properties
    }
  }
  
  // MARK: -
  // MARK: Layout Properties -
  
  private(set) public var layoutState = GridProperties.LayoutState.none
  
  // MARK:-
  // MARK: Init -
  
  public init(properties: GridProperties) {
    super.init(frame: .zero)
    self.properties = properties
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK:-
  // MARK: Platform Dependant -
  
  #if os(OSX)
  public override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
    guard let context = NSGraphicsContext.current?.cgContext else { return }
    drawWithCoreGraphics(context)
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  override public func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    drawWithCoreGraphics(context)
  }
  #endif
  
  #if os(OSX)
  public override var isFlipped: Bool {
    return true
  }
  #endif
}

#if os(OSX)
extension GridDrawingView: CALayerDelegate {
  public func draw(_ layer: CALayer, in ctx: CGContext) {
    drawWithCoreGraphics(ctx)
  }
}
#endif

// MARK:-
// MARK: Drawing -

private extension GridDrawingView {
  func drawWithCoreGraphics(_ context: CGContext) {
    context.saveGState()
    DrawGrid().draw(context, rectToFill: bounds, properties: properties)
    context.restoreGState()
  }
}

