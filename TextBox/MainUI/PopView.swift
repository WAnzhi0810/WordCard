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
        switch with
        {
        case .Model:
            controller.PopViewModelCollectionView.isHidden = false
        case .Adjustment:
            controller.PopViewModelCollectionView.isHidden = true
        }
        
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            controller.PopViewBottom.constant = 0
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func popDown(in controller: ViewController)
    {
        UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            controller.PopViewBottom.constant = -Size.PopView.Height
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }
    

}
