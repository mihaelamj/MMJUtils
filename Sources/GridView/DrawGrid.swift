//
//  DrawGrid.swift
//  MMJUtils - GridView
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation
import CoreGraphics
import GridProperties

public struct DrawGrid {
  public func draw(_ context: CGContext, rectToFill: CGRect, properties: GridProperties) {
    
    let squareSide = properties.lineSize.sideWidth
    let lineWidth = properties.lineSize.lineWidth
    let bounds = rectToFill
    
    
    let whiteColor = properties.colors.backgroundColor.cgColor
    context.setFillColor(whiteColor)
    context.fill(bounds)
    
    let color = properties.colors.lineColor.cgColor
    context.setStrokeColor(color)
    context.setLineWidth(lineWidth)
    
    // Stroke the border
    context.stroke(bounds)

    for x in 1..<Int(bounds.height / squareSide) {
      // Vertical line
      context.move(to: CGPoint(x: CGFloat(x) * squareSide, y: 0))
      context.addLine(to: CGPoint(x: CGFloat(x) * squareSide, y: bounds.height))

      for y in 1..<Int(bounds.width / squareSide) {
        // Horizontal line
        context.move(to: CGPoint(x: 0, y: CGFloat(y) * squareSide))
        context.addLine(to: CGPoint(x: bounds.width, y: CGFloat(y) * squareSide))
      }
    }

    // Stroke grid
    context.strokePath()
    
    // Options

    // Draw top-left red square
    if properties.options.contains(.hasTopLeftSquare) {
      context.setFillColor(properties.colors.topLeftSquareColor.cgColor)
      context.fill(CGRect(x: 0, y: 0, width: squareSide, height: squareSide))
    }
    
    // Draw top-bottom yellow square
    if properties.options.contains(.hasBottomRightSquare) {
      // Draw yellow square
      let x = bounds.size.width - squareSide
      let y = bounds.size.height - squareSide
      context.setFillColor(properties.colors.bottomRightSquareColor.cgColor)
      context.fill(CGRect(x: x, y: y, width: squareSide, height: squareSide))
    }
    
    // Draw blue triangle along the diagonal
    if properties.options.contains(.hasDiagonalTriangle) {
      context.setFillColor(properties.colors.diagonalTriangleColor.cgColor)
      context.move(to: CGPoint(x: bounds.size.width, y: 0))
      context.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height))
      context.addLine(to: CGPoint(x: 0, y: bounds.size.height))
      context.closePath()
      context.fillPath()
    }
    
    // Draw red dot in the middle
    if properties.options.contains(.hasDotInTheMiddle) {
      context.setFillColor(properties.colors.centerCircleColor.cgColor)
      let middlePoint = CGPoint(x: 0.5, y: 0.5)
      let radius: CGFloat = 5.0
      context.fillEllipse(in: CGRect(x: (middlePoint.x * bounds.size.width) - radius,
                                     y: (middlePoint.y * bounds.size.height) - radius,
                                     width: 2 * radius,
                                     height: 2 * radius))
    }
  }
}
