//
//  GridView.swift
//  
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


public class GridDrawingView: ViewType {
  
  // MARK:-
  // MARK: Properties -
  
  public var options: GridProperties.Options = .all
  public var lineSize: GridProperties.LineSize = .normal
  
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
    DrawGrid().draw(context, rectToFill: bounds, options: options, lineSize: lineSize)
    context.restoreGState()
  }
}
