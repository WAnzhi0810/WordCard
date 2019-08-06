//
//  Size.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class Size {
    
    static let ScreenWidth = UIScreen.main.bounds.width
    static let ScreenHeight = UIScreen.main.bounds.height
    
    static var KeyboardHeight = ScreenWidth * 0.688
    {
        didSet {
            Size.KeyboardView.Height = Size.KeyboardHeight - Size.EditAccessoryView.Height
        }
    }
    
    static let StatusBarHeight = UIApplication.shared.statusBarFrame.height
    static let BottomHeight: CGFloat = (UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom)!
    
    
    class PopView {
        static let Height: CGFloat = ScreenHeight * 0.4
        static let CollectionViewLength: CGFloat = ScreenWidth * 5.0 / 19.0
        static let CollectionViewGap: CGFloat = ScreenWidth / 19.0
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
        static let HeightInit: CGFloat = ScreenHeight - StatusBarHeight - BottomHeight - 70.0
    }

}


