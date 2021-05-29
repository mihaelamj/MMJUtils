//
//  FloatingPoint+Nearest.swift
//  MMJUtils - FloatingPointUtil
//
//  Created by Mihaela Mihaljevic Jakic on 25.05.2021..
//  https://stackoverflow.com/questions/27922406/round-double-to-closest-10

public extension FloatingPoint {
  func rounded(to value: Self, roundingRule: FloatingPointRoundingRule = .toNearestOrAwayFromZero) -> Self {
    (self / value).rounded(roundingRule) * value
  }
}
