//
//  Size.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class Size {
    
    static func reload()
    {
        Size.ScreenWidth = UIScreen.main.bounds.width
        Size.ScreenHeight = UIScreen.main.bounds.height
    }
    
    static var ScreenWidth = UIScreen.main.bounds.width
    static var ScreenHeight = UIScreen.main.bounds.height
    static let ScreenLongWidth = ScreenWidth < ScreenHeight ? ScreenHeight : ScreenWidth
    static let ScreenShortWidth = ScreenWidth > ScreenHeight ? ScreenHeight : ScreenWidth
    
    static var KeyboardHeight = ScreenWidth * 0.688
    {
        didSet {
            Size.KeyboardView.Height = Size.KeyboardHeight - Size.EditAccessoryView.Height
        }
    }
    
    static let StatusBarHeight = UIApplication.shared.statusBarFrame.height
    static let BottomHeight = { () -> CGFloat in
        if System.isDeviceLandscape()
        {
            return (UIApplication.shared.delegate?.window?!.safeAreaInsets.right)!
        }
        else
        {
            return (UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom)!
        }
        /*switch System.currentOrientation
        {
        case .landscapeLeft:
            return (UIApplication.shared.delegate?.window?!.safeAreaInsets.right)!
        case .landscapeRight:
            return (UIApplication.shared.delegate?.window?!.safeAreaInsets.left)!
        case .portrait:
            return (UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom)!
        default:
            break
        }
        return 0*/
    }
    
    
    class PopView {
        static let Height: CGFloat = ScreenLongWidth * 0.4
        
        static let CollectionViewLength = { () -> CGFloat in
            if System.isDeviceLandscape()
            {
                return (PopView.Height - Size.BottomHeight()) * 5.0 / 19.0
            }
            else
            {
                return ScreenShortWidth * 5.0 / 19.0
            }
        }
        
        static let CollectionViewGap = { () -> CGFloat in
            if System.isDeviceLandscape()
            {
                return (PopView.Height - Size.BottomHeight()) / 19.0
            }
            else
            {
                return ScreenShortWidth / 19.0
            }
        }
    }
    
    class EditAccessoryView {
        static let Height: CGFloat = 50.0
    }
    
    class KeyboardView {
        static var Height: CGFloat = KeyboardHeight - EditAccessoryView.Height
    }
    
    class TextBox {
        static let Width: CGFloat = 600
        static var size: CGFloat = 600
        static let displayWidth: CGFloat = (Size.ScreenWidth < Size.ScreenHeight ? Size.ScreenWidth : Size.ScreenHeight) * 0.8
        static var scaleRatio = displayWidth / Width
    }
    
    class TextBoxScrollView {
        static let HeightInit: CGFloat = ScreenHeight - StatusBarHeight - BottomHeight() - 70.0
    }

}


