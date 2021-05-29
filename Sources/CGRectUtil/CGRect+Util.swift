//
//  CGRect+Util.swift
//  MMJUtils - CGRectUtil
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import CoreGraphics

public extension CGRect {
  static func integralCenteredInRect(innerRect: CGRect, outerRect: CGRect) -> CGRect {
    let originX: CGFloat = outerRect.origin.x + ((outerRect.size.width - innerRect.size.width) * 0.5);
    let originY: CGFloat = outerRect.origin.y + ((outerRect.size.height - innerRect.size.height) * 0.5);
    return CGRect(x: originX, y: originY, width: innerRect.size.width, height: innerRect.size.height).integral;
  }
}
