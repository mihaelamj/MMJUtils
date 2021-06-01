//
//  GridViewSwiftUI.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 01.06.2021..
//

import SwiftUI
import GridProperties

@available(macOS 10.15, *)
public struct GridViewSwiftUI: View {

  @State var properties: GridProperties
  
  public var body: some View {
    
    let squareSide = properties.lineSize.sideWidth
    let lineWidth = properties.lineSize.lineWidth
    
    GeometryReader { geometry in
      ZStack {
        // Background
        Color(properties.colors.backgroundColor)
        
        // Grid
        GridPathMaker.makeDrawGridPath(size: geometry.size, squareSide: squareSide)
          .fill(Color(properties.colors.backgroundColor))
        GridPathMaker.makeDrawGridPath(size: geometry.size, squareSide: squareSide)
          .stroke(Color(properties.colors.lineColor), lineWidth: lineWidth) // very transparent grey
        
        // Top-Left square
        if properties.options.contains(.hasTopLeftSquare) {
          GridPathMaker.makeTopLeftSquarePath(size: geometry.size, squareSide: squareSide)
            .fill(Color(properties.colors.topLeftSquareColor)) // half-transparent black
        }
        
        // Bottom-Right sqare
        if properties.options.contains(.hasBottomRightSquare) {
          GridPathMaker.makeBottomRightSquarePath(size: geometry.size, squareSide: squareSide)
            .fill(Color(properties.colors.bottomRightSquareColor)) // half-transparent black
        }
        
        // Diagonal triangle
        if properties.options.contains(.hasDiagonalTriangle) {
          GridPathMaker.makeDiagonalTrianglePath(size: geometry.size)
            .fill(Color(properties.colors.diagonalTriangleColor)) // half-transparent blue
        }
        
        // Middle red dot
        if properties.options.contains(.hasDotInTheMiddle) {
          GridPathMaker.makeCenterCirclePath(size: geometry.size)
            .fill(Color(properties.colors.centerCircleColor)) // half-transparent red
        }
      }
    }
    
  }
}

@available(macOS 10.15, *)
public struct GridViewSwiftUI_Previews: PreviewProvider {
  
  public static var previews: some View {
    ZStack {
      GridViewSwiftUI(properties: GridProperties.`default`)
    }.frame(width: 400, height: 400, alignment: .center)
  }
}
