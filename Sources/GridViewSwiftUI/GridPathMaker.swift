//
//  GridPathMaker.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 01.06.2021..
//

import SwiftUI

@available(iOS 13, *)

@available(macOS 10.15, *)

public struct GridPathMaker {

  static func makeDrawGridPath(size: CGSize, squareSide: CGFloat) -> Path {
    return Path { path in
      
      // Vertical lines
      for x in 1..<Int(size.height / squareSide) {
        path.move(to: CGPoint(x: CGFloat(x) * squareSide, y: 0))
        path.addLine(to: CGPoint(x: CGFloat(x) * squareSide, y: size.height))
      }
      
      // Horizontal lines
      for y in 1..<Int(size.width / squareSide) {
        path.move(to: CGPoint(x: 0, y: CGFloat(y) * squareSide))
        path.addLine(to: CGPoint(x: size.width, y: CGFloat(y) * squareSide))
      }
      
    }
  }
  
  static func makeTopLeftSquarePath(size: CGSize, squareSide: CGFloat) -> Path {
    return Path { path in
      path.addRect(CGRect(x: 0, y: 0, width: squareSide, height: squareSide))
    }
  }
  
  static func makeBottomRightSquarePath(size: CGSize, squareSide: CGFloat) -> Path {
    return Path { path in
      let x = size.width - squareSide
      let y = size.height - squareSide
      path.addRect(CGRect(x: x, y: y, width: squareSide, height: squareSide))
    }
  }
  
  static func makeDiagonalTrianglePath(size: CGSize) -> Path {
    return Path { path in
      path.move(to: CGPoint(x: size.width, y: 0))
      path.addLine(to: CGPoint(x: size.width, y: size.height))
      path.addLine(to: CGPoint(x: 0, y: size.height))
    }
  }
  
  static func makeCenterCirclePath(size: CGSize) -> Path {
    return Path { path in
      let middlePoint = CGPoint(x: 0.5, y: 0.5)
      let radius: CGFloat = 5.0
      path.addEllipse(in: CGRect(x: (middlePoint.x * size.width) - radius,
                                     y: (middlePoint.y * size.height) - radius,
                                     width: 2 * radius,
                                     height: 2 * radius))
    }
  }
}
