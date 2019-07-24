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
