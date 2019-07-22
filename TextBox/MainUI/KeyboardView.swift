//
//  PopupView.swift
//  TextBox
//
//  Created by OX CL on 2019/7/19.
//  Copyright © 2019 OX CL. All rights reserved.
//

import Foundation
import UIKit


class KeyboardView {
    
    class FontView {
        static var buttons = [UIButton]()
        static var TitleLabel: UILabel!
    }
    
    class FontSizeView {
        enum ID: Int {
            case SmallSize = 1
            case MediumSize = 2
            case LargeSize = 3
            case LButton = 4
            case RButton = 5
        }
        static var TitleLabel: UILabel!
        static var SmallSize: UIButton!
        static var MediumSize: UIButton!
        static var LargeSize: UIButton!
        static var SizeNumberLabel: UILabel!
        static var LButton: UIButton!
        static var RButton: UIButton!
    }
    
    static func GenerateView(in controller: ViewController, tag: Int) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
        
        switch tag
        {
        case EditAccessoryView.buttonID.Font.rawValue:
            view.addSubview(GenerateFontView(in: controller))
            FontOperation(tag: Font.FontName.allValues.firstIndex(of: EditView.current.font) ?? 0, in: controller)
        case EditAccessoryView.buttonID.Fontsize.rawValue:
            view.addSubview(GenerateFontsizeView(in: controller))
        default:
            break
        }
        
        view.addSubview(CloseButton(in: controller))
        
        return view
    }
    
    private static func CloseButton(in controller: ViewController) -> UIButton
    {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: Size.ScreenWidth - 45.0, y: 15.0, width: 30.0, height: 30.0)
        button.setTitle("X", for: UIControl.State.normal)
        button.addTarget(controller, action: #selector(controller.KeyboardViewClose), for: UIControl.Event.touchUpInside)
        
        return button
    }
    
    private static func GenerateFontView(in controller: ViewController) -> UIScrollView
    {
        FontView.buttons.removeAll()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
        var currentY: CGFloat = 70.0
        
        for (tag, oneName) in Font.FontName.allValues.enumerated()
        {
            let oneButton = UIButton(type: UIButton.ButtonType.custom)
            oneButton.frame = CGRect(x: 50, y: currentY, width: Size.ScreenWidth - 100.0, height: 60.0)
            oneButton.tag = tag
            oneButton.setTitle(oneName.rawValue.localize(), for: .normal)
            oneButton.titleLabel?.font = Font.set(fontName: oneName, size: 17)
            oneButton.setTitleColor(Color.button.unSelectFG, for: .normal)
            oneButton.setTitleColor(Color.button.SelectFG, for: .selected)
            oneButton.backgroundColor = Color.button.unSelectBG
            oneButton.layer.cornerRadius = 15.0
            
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchDown(_:)), for: UIControl.Event.touchDown)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchDown(_:)), for: UIControl.Event.touchDragEnter)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchCancel)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchDragExit)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchUpInside)
            oneButton.addTarget(controller, action: #selector(controller.KeyboardFontViewButton(_:)), for: UIControl.Event.touchUpInside)
            
            FontView.buttons.append(oneButton)
            scrollView.addSubview(oneButton)
            
            currentY += 80.0
        }
        
        FontView.TitleLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: 20.0, width: 100.0, height: 20.0))
        FontView.TitleLabel.text = "字体".localize()
        FontView.TitleLabel.textAlignment = .center
        FontView.TitleLabel.font = Font.set(systemFontSize: 20, weight: UIFont.Weight.heavy)
        scrollView.addSubview(FontView.TitleLabel)
        
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: 0, height: currentY)
        
        return scrollView
    }
    
    private static func GenerateFontsizeView(in controller: ViewController) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
        
        FontSizeView.TitleLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: 20.0, width: 100.0, height: 20.0))
        FontSizeView.TitleLabel.text = "字体大小".localize()
        FontSizeView.TitleLabel.textAlignment = .center
        FontSizeView.TitleLabel.font = Font.set(systemFontSize: 20, weight: UIFont.Weight.heavy)
        
        FontSizeView.SmallSize = UIButton(type: UIButton.ButtonType.system)
        FontSizeView.SmallSize.frame = CGRect(x: Size.ScreenWidth / 2.0 - 100.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.SmallSize.tag = FontSizeView.ID.SmallSize.rawValue
        FontSizeView.SmallSize.setTitle("S", for: .normal)
        FontSizeView.SmallSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.MediumSize = UIButton(type: UIButton.ButtonType.system)
        FontSizeView.MediumSize.frame = CGRect(x: Size.ScreenWidth / 2.0 - 25.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.MediumSize.tag = FontSizeView.ID.MediumSize.rawValue
        FontSizeView.MediumSize.setTitle("M", for: .normal)
        FontSizeView.MediumSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.LargeSize = UIButton(type: UIButton.ButtonType.system)
        FontSizeView.LargeSize.frame = CGRect(x: Size.ScreenWidth / 2.0 + 50.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.LargeSize.tag = FontSizeView.ID.LargeSize.rawValue
        FontSizeView.LargeSize.setTitle("L", for: .normal)
        FontSizeView.LargeSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.SizeNumberLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: Size.KeyboardView.Height / 2.0, width: 100.0, height: 60.0))
        FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
        FontSizeView.SizeNumberLabel.textAlignment = .center
        FontSizeView.SizeNumberLabel.font = Font.set(systemFontSize: 48, weight: UIFont.Weight.medium)
        
        FontSizeView.LButton = UIButton(type: UIButton.ButtonType.system)
        FontSizeView.LButton.frame = CGRect(x: Size.ScreenWidth / 2.0 - 80.0, y: Size.KeyboardView.Height / 2.0 + 15.0, width: 30.0, height: 30.0)
        FontSizeView.LButton.tag = FontSizeView.ID.LButton.rawValue
        FontSizeView.LButton.setTitle("-", for: .normal)
        FontSizeView.LButton.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.RButton = UIButton(type: UIButton.ButtonType.system)
        FontSizeView.RButton.frame = CGRect(x: Size.ScreenWidth / 2.0 + 50.0, y: Size.KeyboardView.Height / 2.0 + 15.0, width: 30.0, height: 30.0)
        FontSizeView.RButton.tag = FontSizeView.ID.RButton.rawValue
        FontSizeView.RButton.setTitle("+", for: .normal)
        FontSizeView.RButton.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        view.addSubview(FontSizeView.TitleLabel)
        view.addSubview(FontSizeView.SmallSize)
        view.addSubview(FontSizeView.MediumSize)
        view.addSubview(FontSizeView.LargeSize)
        view.addSubview(FontSizeView.SizeNumberLabel)
        view.addSubview(FontSizeView.LButton)
        view.addSubview(FontSizeView.RButton)
        
        return view
    }
    
    
    
    static func FontOperation(tag: Int, in controller: ViewController)
    {
        if tag >= Font.FontName.allValues.count
        {
            return
        }
        
        for oneButton in FontView.buttons
        {
            oneButton.isSelected = false
            oneButton.backgroundColor = Color.button.unSelectBG
        }
        FontView.buttons[tag].isSelected = true
        FontView.buttons[tag].backgroundColor = Color.button.SelectBG
        
        EditView.current.font = Font.FontName.allValues[tag]
        controller.TextBoxEditView.updateFont()
    }
    
    static func FontSizeOperation(tag: Int, in controller: ViewController)
    {
        switch tag
        {
        case FontSizeView.ID.SmallSize.rawValue:
            EditView.current.size = 12
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.MediumSize.rawValue:
            EditView.current.size = 17
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.LargeSize.rawValue:
            EditView.current.size = 24
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.LButton.rawValue:
            if EditView.current.size <= 9
            {
                return
            }
            EditView.current.size -= 1.0
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.RButton.rawValue:
            if EditView.current.size >= 60
            {
                return
            }
            EditView.current.size += 1.0
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        default:
            break
        }
    }
    
    
}

