//
//  CenteredGridView.swift
//  MMJUtils - GridView
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

#if os(iOS) || os(tvOS)
import UIKit
#endif

#if os(OSX)
import Cocoa
#endif

import GridProperties

public class CenteredGridView: ViewType {
  
  private(set) public lazy var gridBackgroundLayer: CALayer = {
    let bl = CALayer()
    bl.opacity = 0.2
    #if os(iOS) || os(tvOS)
    bl.contentsScale = UIScreen.main.scale
    bl.backgroundColor = UIColor.systemGray.cgColor
    #endif
    #if os(OSX)
    bl.backgroundColor = NSColor.systemGray.cgColor
    bl.contentsScale = NSScreen.main?.backingScaleFactor ?? 2.0
    bl.isGeometryFlipped = true
    #endif
    return bl
  }()
  
  private(set) public lazy var gridView: GridDrawingView = {
    let gv = GridDrawingView()
    gv.options = .all
    gv.lineSize = .small
    return gv
  }()
  
  // MARK: -
  // MARK: Init -
  
  public required init() {
    super.init(frame: .zero)
    setupLayer()
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  #if os(OSX)
  public override var isFlipped: Bool {
    return true
  }
  #endif
  
  // MARK: -
  // MARK: Layout -
  
  private func myLayoutSubviews() {
    if #available(macOS 10.11, *) {
      sizeToSuperView()
    } 
    
    var topDelta: CGFloat = 0.0
    var bottomDelta: CGFloat = 0.0
    #if os(iOS) || os(tvOS)
    topDelta = layoutMargins.top
    bottomDelta = layoutMargins.bottom
    #endif
    
    let gap: CGFloat = 10.0; let xOffset: CGFloat = 20.0;  let yOffset: CGFloat = 10.0 + topDelta + gap
    let remainingRect = CGRect(
      x: round(xOffset / 2.0),
      y: yOffset,
      width: bounds.size.width - xOffset,
      height: bounds.size.height - (yOffset + bottomDelta)
    )
    
    layoutGridBackgroundLayer(rect: remainingRect)
    layoutGridView(rect: remainingRect, squareSize: gridView.lineSize.sideWidth)
  }
  
  #if os(OSX)
  public override func layout() {
    super.layout()
    myLayoutSubviews()
  }
  #endif
  
  #if os(iOS) || os(tvOS)
  public override func layoutSubviews() {
    super.layoutSubviews()
    myLayoutSubviews()
  }
  #endif
}

// MARK: -
// MARK: Private Setup -

private extension CenteredGridView {
  
  func setupLayer() {
    #if os(OSX)
    wantsLayer = true
    layer?.addSublayer(gridBackgroundLayer)
    #endif
    
    #if os(iOS) || os(tvOS)
    layer.addSublayer(gridBackgroundLayer)
    #endif
  }
  
  func setupViews() {
    addSubview(gridView)
  }
  
  
  @available(macOS 10.11, *)
  func sizeToSuperView() {
    guard let aSuperview = superview else { return }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: aSuperview.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: aSuperview.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: aSuperview.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: aSuperview.bottomAnchor).isActive = true
  }
}

// MARK: -
// MARK: Private Layout -

private extension CenteredGridView {
  
  func layoutGridBackgroundLayer(rect: CGRect) {
    gridBackgroundLayer.frame = rect
  }
  
  func layoutGridView(rect: CGRect, squareSize: CGFloat) {
    let topRect = CGRect.gridViewTopRectFrom(rect: rect, squareSide: squareSize, gap: 20.0)
    gridView.frame = topRect
    debugPrint("gridView.frame = `\(gridView.frame)`")
  }
}
