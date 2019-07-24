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
    
    class PopView {
        static let Height: CGFloat = 300.0
        static let CollectionViewLength: CGFloat = 100.0
        static let CollectionViewGap: CGFloat = 15.0
    }
    
    class EditAccessoryView {
        static let Height: CGFloat = 50.0
    }
    
    class KeyboardView {
        static var Height: CGFloat = KeyboardHeight - EditAccessoryView.Height
    }
    
    class TextBox {
        static let Width: CGFloat = (Size.ScreenWidth < Size.ScreenHeight ? Size.ScreenWidth : Size.ScreenHeight) * 0.8
    }

}


