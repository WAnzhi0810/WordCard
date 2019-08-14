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
    
    func heightInit(in controller: ViewController)
    {
        if System.isDeviceLandscape()
        {
            controller.PopViewWidth.constant = Size.PopView.Height
        }
        else
        {
            controller.PopViewHeight.constant = Size.PopView.Height
        }
    }

    func popUp(with: displayType, in controller: ViewController)
    {
        switch with
        {
        case .Model:
            controller.PopViewModelCollectionView.isHidden = false
            controller.PopViewAdjustmentTableView.isHidden = true
        case .Adjustment:
            controller.PopViewModelCollectionView.isHidden = true
            controller.PopViewAdjustmentTableView.isHidden = false
        }
        
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            if System.isDeviceLandscape()
            {
                controller.PopViewTrailing.constant = 0
            }
            else
            {
                controller.PopViewBottom.constant = 0
            }
            
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func popDown(in controller: ViewController)
    {
        UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            if System.isDeviceLandscape()
            {
                controller.PopViewTrailing.constant = -Size.PopView.Height-300.0
            }
            else
            {
                controller.PopViewBottom.constant = -Size.PopView.Height-300.0
            }
            
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}
