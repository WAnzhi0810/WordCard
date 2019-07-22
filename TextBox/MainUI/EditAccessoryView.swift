//
//  EditAccessoryView.swift
//  TextBox
//
//  Created by OX CL on 2019/7/17.
//  Copyright © 2019 OX CL. All rights reserved.
//

import Foundation
import UIKit


class EditAccessoryView {
    
    enum buttonID: Int
    {
        case Font = 1
        case Fontsize = 2
        case LeftAlign = 3
        case CenterAlign = 4
        case RightAlign = 5
    }
    
    class button {
        static var Font: UIButton!
        static var Fontsize: UIButton!
        static var LeftAlign: UIButton!
        static var CenterAlign: UIButton!
        static var RightAlign: UIButton!
    }
    
    static func ButtonSelectOperation(sender: UIButton)
    {
        switch sender.tag
        {
        case buttonID.Font.rawValue, buttonID.Fontsize.rawValue:
            let selection = !sender.isSelected
            button.Font.isSelected = false
            button.Fontsize.isSelected = false
            sender.isSelected = selection
            
        case buttonID.LeftAlign.rawValue, buttonID.CenterAlign.rawValue, buttonID.RightAlign.rawValue:
            button.LeftAlign.isSelected = false
            button.CenterAlign.isSelected = false
            button.RightAlign.isSelected = false
            sender.isSelected = true
            
        default:
            break
        }
    }
    
    static func FontButtonSelectionClear()
    {
        button.Font.isSelected = false
        button.Fontsize.isSelected = false
    }
    
    static func GenerateView(in controller: ViewController) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.EditAccessoryView.Height))
        
        view.addSubview(ComplishButton(in: controller))
        view.addSubview(ScrollView(in: controller))
        
        self.ButtonSelectOperation(sender: button.CenterAlign)
        
        return view
    }
    
    
    // MARK: - Buttons Init
    
    private static func ComplishButton(in controller: ViewController) -> UIButton
    {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: Size.ScreenWidth - 75.0, y: 5, width: 70.0, height: Size.EditAccessoryView.Height-10.0)
        button.setTitle("Done", for: UIControl.State.normal)
        button.addTarget(controller, action: #selector(controller.KeyboardComplishButton), for: UIControl.Event.touchUpInside)
        
        return button
    }
    
    private static func ScrollView(in controller: ViewController) -> UIScrollView
    {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth - 75.0, height: Size.EditAccessoryView.Height))
        view.bounces = true
        
        view.addSubview(FontButton(in: controller))
        view.addSubview(FontSizeButton(in: controller))
        view.addSubview(LeftAlignButton(in: controller))
        view.addSubview(CenterAlignButton(in: controller))
        view.addSubview(RightAlignButton(in: controller))
        
        view.contentSize = CGSize(width: 50.0 * 5, height: 0)
        
        return view
    }
    
    private static func FontButton(in controller: ViewController) -> UIButton
    {
        button.Font = UIButton(type: UIButton.ButtonType.system)
        button.Font.frame = CGRect(x: 5, y: 5, width: 40.0, height: Size.EditAccessoryView.Height-10.0)
        button.Font.setTitle("F", for: UIControl.State.normal)
        button.Font.tag = buttonID.Font.rawValue
        button.Font.addTarget(controller, action: #selector(controller.KeyboardButton(_:)), for: UIControl.Event.touchUpInside)
        
        return button.Font
    }
    
    private static func FontSizeButton(in controller: ViewController) -> UIButton
    {
        button.Fontsize = UIButton(type: UIButton.ButtonType.system)
        button.Fontsize.frame = CGRect(x: 50.0 * 1 + 5, y: 5, width: 40.0, height: Size.EditAccessoryView.Height-10.0)
        button.Fontsize.setTitle("Si", for: UIControl.State.normal)
        button.Fontsize.tag = buttonID.Fontsize.rawValue
        button.Fontsize.addTarget(controller, action: #selector(controller.KeyboardButton(_:)), for: UIControl.Event.touchUpInside)
        
        return button.Fontsize
    }
    
    private static func LeftAlignButton(in controller: ViewController) -> UIButton
    {
        button.LeftAlign = UIButton(type: UIButton.ButtonType.system)
        button.LeftAlign.frame = CGRect(x: 50.0 * 2 + 5, y: 5, width: 40.0, height: Size.EditAccessoryView.Height-10.0)
        button.LeftAlign.setTitle("L", for: UIControl.State.normal)
        button.LeftAlign.tag = buttonID.LeftAlign.rawValue
        button.LeftAlign.addTarget(controller, action: #selector(controller.KeyboardButton(_:)), for: UIControl.Event.touchUpInside)
        
        return button.LeftAlign
    }
    
    private static func CenterAlignButton(in controller: ViewController) -> UIButton
    {
        button.CenterAlign = UIButton(type: UIButton.ButtonType.system)
        button.CenterAlign.frame = CGRect(x: 50.0 * 3 + 5, y: 5, width: 40.0, height: Size.EditAccessoryView.Height-10.0)
        button.CenterAlign.setTitle("M", for: UIControl.State.normal)
        button.CenterAlign.tag = buttonID.CenterAlign.rawValue
        button.CenterAlign.addTarget(controller, action: #selector(controller.KeyboardButton(_:)), for: UIControl.Event.touchUpInside)
        
        return button.CenterAlign
    }
    
    private static func RightAlignButton(in controller: ViewController) -> UIButton
    {
        button.RightAlign = UIButton(type: UIButton.ButtonType.system)
        button.RightAlign.frame = CGRect(x: 50.0 * 4 + 5, y: 5, width: 40.0, height: Size.EditAccessoryView.Height-10.0)
        button.RightAlign.setTitle("R", for: UIControl.State.normal)
        button.RightAlign.tag = buttonID.RightAlign.rawValue
        button.RightAlign.addTarget(controller, action: #selector(controller.KeyboardButton(_:)), for: UIControl.Event.touchUpInside)
        
        return button.RightAlign
    }
    
}
