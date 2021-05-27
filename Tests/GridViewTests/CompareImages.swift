//
//  File.swift
//  
//
//  Created by Mihaela Mihaljevic Jakic on 27.05.2021..
//

import Foundation
import CoreGraphics
import CoreImage

public extension CGImage {
  
//  static func func compareImages(image1:CGImage, image2:CGImage) -> Int {
//    var diff = 0
//    
//    // First create the CIImage representations of the CGImage.
//    let ciImage1 = CIImage(CGImage: image1)
//    let ciImage2 = CIImage(CGImage: image2)
//    
//    // Create the difference blend mode filter and set its properties.
//    let diffFilter = CIFilter(name: "CIDifferenceBlendMode")
//    diffFilter.setDefaults()
//    diffFilter.setValue(ciImage1, forKey: kCIInputImageKey)
//    diffFilter.setValue(ciImage2, forKey: kCIInputBackgroundImageKey)
//    
//    // Create the area max filter and set its properties.
//    let areaMaxFilter = CIFilter(name: "CIAreaMaximum")
//    areaMaxFilter.setDefaults()
//    areaMaxFilter.setValue(diffFilter.valueForKey(kCIOutputImageKey), forKey: kCIInputImageKey)
//    let compareRect = CGRectMake(0.0, 0.0, CGFloat(CGImageGetWidth(image1)),
//                                 CGFloat(CGImageGetHeight(image1)))
//    let extents = CIVector(CGRect: compareRect)
//    areaMaxFilter.setValue(extents, forKey: kCIInputExtentKey)
//    
//    // The filters have been setup, now set up the CGContext bitmap context the
//    // output is drawn to. Setup the context with our supplied buffer.
//    let alphaInfo = CGImageAlphaInfo.PremultipliedLast
//    let bitmapInfo = CGBitmapInfo(rawValue: alphaInfo.rawValue)
//    let colorSpace = CGColorSpaceCreateDeviceRGB()
//    var buf: [CUnsignedChar] = Array<CUnsignedChar>(count: 16, repeatedValue: 255)
//    let context = CGBitmapContextCreate(&buf, 1, 1, 8, 16, colorSpace, bitmapInfo)
//    
//    // Now create the core image context CIContext from the bitmap context.
//    let ciContextOpts = [
//      kCIContextWorkingColorSpace : colorSpace,
//      kCIContextUseSoftwareRenderer : false
//    ]
//    let ciContext = CIContext(CGContext: context, options: ciContextOpts)
//    
//    // Get the output CIImage and draw that to the Core Image context.
//    let valueImage = areaMaxFilter.valueForKey(kCIOutputImageKey)! as CIImage
//    ciContext.drawImage(valueImage, inRect: CGRectMake(0,0,1,1),
//                        fromRect: valueImage.extent())
//    
//    // This will have modified the contents of the buffer used for the CGContext.
//    // Find the maximum value of the different color components. Remember that
//    // the CGContext was created with a Premultiplied last meaning that alpha
//    // is the fourth component with red, green and blue in the first three.
//    let maxVal = max(buf[0], max(buf[1], buf[2]))
//    diff = Int(maxVal)
//    return diff
//  }
  
}

