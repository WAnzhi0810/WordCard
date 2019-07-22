//
//  PopView.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class PopView: UIView {
    
    enum displayType {
        case Model
        case Adjustment
    }

    func popUp(with: displayType, in controller: ViewController)
    {
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            //controller.ChangeStatusBarStyle(isChangeToBlack: false, duration: 0.5)
            controller.PopViewBottom.constant = 0
            //controller.DarkenView.alpha = 0.6
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func popDown(in controller: ViewController)
    {
        UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            //controller.ChangeStatusBarStyle(isChangeToBlack: true, duration: 0.5)
            controller.PopViewBottom.constant = -Size.PopView.Height
            //controller.DarkenView.alpha = 0
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}
