//
//  CGrect+Random.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import CoreGraphics

public extension CGRect {
  static func random(in bounds: CGRect) -> CGRect {
    let l = CGFloat.random(in: (0.1 * bounds.size.width)...(0.7 * bounds.size.width))
    return CGRect(
      x: 0.5 * (bounds.width - l) + CGFloat.random(in: (-0.25 * bounds.size.width)...(0.25 * bounds.size.width)),
      y: 0.5 * (bounds.height - l) + CGFloat.random(in: (-0.25 * bounds.size.height)...(0.25 * bounds.size.height)),
      width: l,
      height: l
    )
  }
}
