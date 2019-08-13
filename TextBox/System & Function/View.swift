//
//  View.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import Foundation
import UIKit



extension UIView
{
    class Shadow
    {
        let radius: CGFloat
        let opacity: Float
        let Yoffset: CGFloat
        
        init(radius: CGFloat, opacity: Float, Yoffset: CGFloat) {
            self.radius = radius
            self.opacity = opacity
            self.Yoffset = Yoffset
        }
    }
    
    func add(Shadow: Shadow)
    {
        self.layer.shadowRadius = Shadow.radius
        self.layer.shadowOpacity = Shadow.opacity
        self.layer.shadowOffset = CGSize(width: 0, height: Shadow.Yoffset)
    }
    
    static func pop(duration: TimeInterval, delay: TimeInterval, doing: @escaping () -> Void, completion: ((Bool) -> Void)?)
    {
        self.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.allowUserInteraction], animations: doing, completion: completion)
    }
    
    static func easeOut(duration: TimeInterval, delay: TimeInterval, doing: @escaping () -> Void, completion: ((Bool) -> Void)?)
    {
        self.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction], animations: doing, completion: completion)
    }
    
    static func linear(duration: TimeInterval, delay: TimeInterval, doing: @escaping () -> Void, completion: ((Bool) -> Void)?)
    {
        self.animate(withDuration: duration, delay: delay, options: [.allowUserInteraction], animations: doing, completion: completion)
    }
    
    
    func getCurrentVC() -> UIViewController?
    {
        var next = self.superview
        while (next != nil)
        {
            let nextResponder = next?.next
            if nextResponder is UIViewController
            {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}

extension UIImage
{
    
    func getGaussianBlur(blurRadius: CGFloat?) -> CGImage
    {
        let thisImage = CIImage(image: self)
        let filter = CIFilter(name: "CIGaussianBlur")!
        
        filter.setValue(thisImage, forKey: kCIInputImageKey)
        filter.setValue(blurRadius, forKey: kCIInputRadiusKey)
        
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: self.size)
        
        return CIContext(options: nil).createCGImage(outputCIImage, from: rect)!
    }
    
    func getMosaic(value: CGFloat?) -> CGImage
    {
        let filter = CIFilter(name: "CIPixellate")!
        let inputImage = CIImage(image: self)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(value, forKey: kCIInputScaleKey)
        
        let outputCIImage = filter.outputImage!
        return CIContext(options: nil).createCGImage(outputCIImage, from: outputCIImage.extent)!
    }
    
    func getPointillize(radius: CGFloat?) -> CGImage
    {
        let filter = CIFilter(name: "CIPointillize")!
        let inputImage = CIImage(image: self)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        if radius != nil
        {
            filter.setValue(radius, forKey: kCIInputRadiusKey)
        }
        
        let outputCIImage = filter.outputImage!
        return CIContext(options: nil).createCGImage(outputCIImage, from: outputCIImage.extent)!
    }
    func getEdge(intensity: CGFloat?) -> CGImage
    {
        let filter = CIFilter(name: "CIEdges")!
        let inputImage = CIImage(image: self)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(intensity, forKey: kCIInputIntensityKey)
        
        let outputCIImage = filter.outputImage!
        return CIContext(options: nil).createCGImage(outputCIImage, from: outputCIImage.extent)!
    }
    func getEdgeWork(radius: CGFloat?) -> CGImage
    {
        let filter = CIFilter(name: "CIEdgeWork")!
        let inputImage = CIImage(image: self)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        
        let outputCIImage = filter.outputImage!
        return CIContext(options: nil).createCGImage(outputCIImage, from: outputCIImage.extent)!
    }
    func getHexagon(scale: CGFloat?) -> CGImage
    {
        let filter = CIFilter(name: "CIHexagonalPixellate")!
        let inputImage = CIImage(image: self)
        
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        
        let outputCIImage = filter.outputImage!
        return CIContext(options: nil).createCGImage(outputCIImage, from: outputCIImage.extent)!
    }
}
