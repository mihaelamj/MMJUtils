//
//  GridDrawingView.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import CoreGraphics

public extension GridDrawingView {
  
  func drawToImage(size: CGSize) -> CGImage? {
    
    // Create a color space
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    // Build Core Graphics ARGB context
    guard let context = CGContext(data: nil,
                                  width: Int(size.width),
                                  height: Int(size.height),
                                  bitsPerComponent: Int(8.0),
                                  bytesPerRow: Int(size.width * 4.0),
                                  space: colorSpace,
                                  bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
    else { return nil }
    
    context.saveGState()
    
    // flip the drawing
    context.translateBy(x: 0, y: size.height);
    context.scaleBy(x: 1.0, y: -1.0);
    
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    DrawGrid().draw(context, rectToFill: rect, options: options, lineSize: lineSize)
    
    context.restoreGState()
//    CGColorSpaceRelease(colorSpace) //CGColorSpaceRelease' is unavailable: Core Foundation objects are automatically memory managed
    
    // Convert to image
    let imageRef = context.makeImage()
    return imageRef
  }
}

import Foundation
import ImageIO

#if os(iOS) || os(tvOS)
import MobileCoreServices
#endif

public extension GridDrawingView {
  
  // plain write to image
  @discardableResult func writeCGImage(_ image: CGImage, to destinationURL: URL) -> Bool {
    guard let destination = CGImageDestinationCreateWithURL(destinationURL as CFURL, kUTTypePNG, 1, nil) else { return false }
    CGImageDestinationAddImage(destination, image, nil)
    return CGImageDestinationFinalize(destination)
  }
  
  func saveImageToDocuments(_ image: CGImage, fileName: String) -> URL? {
    guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    let filePath = path.appendingPathComponent(fileName)
    writeCGImage(image, to: filePath)
    return filePath
  }
  
}
