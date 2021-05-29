//
//  CGRect+GridView.swift
//  MMJUtils - GridView
//
//  Created by Mihaela Mihaljevic Jakic on 29.05.2021..
//

import CoreGraphics

public extension CGRect {
  
  static func gridFrameSideFor(_ rectSide: CGFloat, withMutlipleOf: CGFloat) -> CGFloat {
    var result = rectSide
    // INFO: side must be a multiple of gridView.squareSide -
    let newSideMultiple = rectSide.truncatingRemainder(dividingBy: withMutlipleOf)
    if newSideMultiple != 0 {
      // try again with the smaller side
      result = gridFrameSideFor(result - 1, withMutlipleOf: withMutlipleOf)
    }
    return result
  }
  
  static func gridViewTopRectFrom(rect: CGRect, squareSide: CGFloat, gap: CGFloat) -> CGRect {
    
    func minSideFrom(rect: CGRect) -> CGFloat {
      return min(rect.size.width, rect.size.height)
    }
    
    let minSide = minSideFrom(rect: rect)
    let candidateSide = round(minSide - gap)
    
    // find the fitting size for width and height of our rect
    let fittingSide = gridFrameSideFor(candidateSide, withMutlipleOf: squareSide)
    
    // center it in super-rect, on X
    let origin = CGPoint(
      x: round((rect.size.width - fittingSide) / 2.0 + gap / 2.0),
      y: rect.origin.y + round(gap / 2.0)
      )
    
    let size = CGSize(width: fittingSide, height: fittingSide)
    let result = CGRect(origin: origin, size: size)
    return result
  }
  
}
