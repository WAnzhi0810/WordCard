//
//  System.swift
//  TextBox
//
//  Created by OX CL on 2019/7/27.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class System {
    
    static var currentOrientation = UIDevice.current.orientation
    
    static func getOrientation() -> UIDeviceOrientation
    {
        return UIDevice.current.orientation
    }
    
    static func isDeviceLandscape() -> Bool
    {
        switch System.currentOrientation
        {
        case .landscapeLeft, .landscapeRight:
            return true
        default:
            return false
        }
    }
    
    static func FeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle)
    {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    static func FeedbackNotificationGenerator(type: UINotificationFeedbackGenerator.FeedbackType)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

}
