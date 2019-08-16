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
        static var fontView : UIView?
        static var fontSizeView : UIView?
        static var scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
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
            if FontView.fontView == nil
            {
                FontView.fontView = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
                FontView.fontView!.addSubview(GenerateFontView(in: controller))
            }
            FontOperation(tag: Font.FontName.allValues.firstIndex(of: EditView.current.font) ?? 0, in: controller)
            view.addSubview(FontView.fontView!)
        case EditAccessoryView.buttonID.Fontsize.rawValue:
            if FontView.fontSizeView == nil
            {
                FontView.fontSizeView = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
                FontView.fontSizeView!.addSubview(GenerateFontsizeView(in: controller))
            }
            view.addSubview(FontView.fontSizeView!)
        default:
            break
        }
        
        view.addSubview(CloseButton(in: controller))
        
        return view
    }
    
    private static func CloseButton(in controller: ViewController) -> UIButton
    {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: Size.ScreenWidth - 45.0, y: 15.0, width: 30.0, height: 30.0)
        button.setImage(UIImage(named: Style.isDark ? "X_w" : "X_b"), for: .normal)
        button.addTarget(controller, action: #selector(controller.KeyboardViewClose), for: UIControl.Event.touchUpInside)
        
        return button
    }
    
    private static func GenerateFontView(in controller: ViewController) -> UIScrollView
    {
        FontView.buttons.removeAll()
        
        FontView.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
        
        var currentY: CGFloat = 70.0
        
        for (tag, oneName) in Font.FontName.allValues.enumerated()
        {
            let oneButton = UIButton(type: UIButton.ButtonType.custom)
            oneButton.frame = CGRect(x: 50, y: currentY, width: Size.ScreenWidth - 100.0, height: 60.0)
            oneButton.tag = tag
            oneButton.setTitle(oneName.rawValue.localize() + (Font.isExist(fontName: oneName) ? "" : " (需要云加载)".localize()), for: .normal)
            oneButton.titleLabel?.font = Font.set(fontName: oneName, size: 17)
            oneButton.titleLabel?.adjustsFontSizeToFitWidth = true
            oneButton.setTitleColor(Style.isDark ? Color.button.black.unSelectFG : Color.button.white.unSelectFG, for: .normal)
            oneButton.setTitleColor(Style.isDark ? Color.button.black.SelectFG : Color.button.white.SelectFG, for: .selected)
            oneButton.backgroundColor = Style.isDark ? Color.button.black.unSelectBG : Color.button.white.unSelectBG
            oneButton.layer.cornerRadius = 15.0
            
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchDown(_:)), for: UIControl.Event.touchDown)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchDown(_:)), for: UIControl.Event.touchDragEnter)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchCancel)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchDragExit)
            oneButton.addTarget(controller, action: #selector(controller.ButtonTouchUp(_:)), for: UIControl.Event.touchUpInside)
            oneButton.addTarget(controller, action: #selector(controller.KeyboardFontViewButton(_:)), for: UIControl.Event.touchUpInside)
            
            FontView.buttons.append(oneButton)
            FontView.scrollView.addSubview(oneButton)
            
            currentY += 80.0
        }
        
        
        FontView.TitleLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: 20.0, width: 100.0, height: 20.0))
        FontView.TitleLabel.text = "字体".localize()
        FontView.TitleLabel.textColor = Color.theme.current
        FontView.TitleLabel.textAlignment = .center
        FontView.TitleLabel.font = Font.set(systemFontSize: 20, weight: UIFont.Weight.heavy)
        FontView.scrollView.addSubview(FontView.TitleLabel)
        
        FontView.scrollView.bounces = true
        FontView.scrollView.contentSize = CGSize(width: 0, height: currentY)
        
        return FontView.scrollView
    }
    
    private static func GenerateFontsizeView(in controller: ViewController) -> UIView
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.ScreenWidth, height: Size.KeyboardView.Height))
        
        FontSizeView.TitleLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: 20.0, width: 100.0, height: 20.0))
        FontSizeView.TitleLabel.text = "字体大小".localize()
        FontSizeView.TitleLabel.textColor = Color.theme.current
        FontSizeView.TitleLabel.textAlignment = .center
        FontSizeView.TitleLabel.font = Font.set(systemFontSize: 20, weight: UIFont.Weight.heavy)
        
        FontSizeView.SmallSize = UIButton(type: UIButton.ButtonType.custom)
        FontSizeView.MediumSize = UIButton(type: UIButton.ButtonType.custom)
        FontSizeView.LargeSize = UIButton(type: UIButton.ButtonType.custom)
        FontSizeView.LButton = UIButton(type: UIButton.ButtonType.custom)
        FontSizeView.RButton = UIButton(type: UIButton.ButtonType.custom)
        
        FontSizeView.SmallSize.frame = CGRect(x: Size.ScreenWidth / 2.0 - 100.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.MediumSize.frame = CGRect(x: Size.ScreenWidth / 2.0 - 25.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.LargeSize.frame = CGRect(x: Size.ScreenWidth / 2.0 + 50.0, y: Size.KeyboardView.Height / 2.0 - 70.0, width: 50.0, height: 50.0)
        FontSizeView.SizeNumberLabel = UILabel(frame: CGRect(x: Size.ScreenWidth / 2.0 - 50.0, y: Size.KeyboardView.Height / 2.0, width: 100.0, height: 60.0))
        FontSizeView.LButton.frame = CGRect(x: Size.ScreenWidth / 2.0 - 80.0, y: Size.KeyboardView.Height / 2.0 + 15.0, width: 30.0, height: 30.0)
        FontSizeView.RButton.frame = CGRect(x: Size.ScreenWidth / 2.0 + 50.0, y: Size.KeyboardView.Height / 2.0 + 15.0, width: 30.0, height: 30.0)
        
        FontSizeView.SmallSize.tag = FontSizeView.ID.SmallSize.rawValue
        FontSizeView.SmallSize.setImage(UIImage(named: Style.isDark ? "FontsizeS_w" : "FontsizeS_b"), for: .normal)
        FontSizeView.SmallSize.setImage(UIImage(named: Style.isDark ? "FontsizeS_sw" : "FontsizeS_sb"), for: .selected)
        FontSizeView.SmallSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.MediumSize.tag = FontSizeView.ID.MediumSize.rawValue
        FontSizeView.MediumSize.setImage(UIImage(named: Style.isDark ? "FontsizeM_w" : "FontsizeM_b"), for: .normal)
        FontSizeView.MediumSize.setImage(UIImage(named: Style.isDark ? "FontsizeM_sw" : "FontsizeM_sb"), for: .selected)
        FontSizeView.MediumSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.LargeSize.tag = FontSizeView.ID.LargeSize.rawValue
        FontSizeView.LargeSize.setImage(UIImage(named: Style.isDark ? "FontsizeL_w" : "FontsizeL_b"), for: .normal)
        FontSizeView.LargeSize.setImage(UIImage(named: Style.isDark ? "FontsizeL_sw" : "FontsizeL_sb"), for: .selected)
        FontSizeView.LargeSize.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
        FontSizeView.SizeNumberLabel.textColor = Color.theme.current
        FontSizeView.SizeNumberLabel.textAlignment = .center
        FontSizeView.SizeNumberLabel.font = Font.set(systemFontSize: 48, weight: UIFont.Weight.medium)
        
        FontSizeView.LButton.tag = FontSizeView.ID.LButton.rawValue
        FontSizeView.LButton.setImage(UIImage(named: Style.isDark ? "Fontsize-_w" : "Fontsize-_b"), for: .normal)
        FontSizeView.LButton.setImage(UIImage(named: Style.isDark ? "Fontsize-_sw" : "Fontsize-_sb"), for: .selected)
        FontSizeView.LButton.addTarget(controller, action: #selector(controller.KeyboardFontSizeViewButton(_:)), for: UIControl.Event.touchUpInside)
        
        FontSizeView.RButton.tag = FontSizeView.ID.RButton.rawValue
        FontSizeView.RButton.setImage(UIImage(named: Style.isDark ? "Fontsize+_w" : "Fontsize+_b"), for: .normal)
        FontSizeView.RButton.setImage(UIImage(named: Style.isDark ? "Fontsize+_sw" : "Fontsize+_sb"), for: .selected)
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
    
    
    static func FontLoadCancelled(tag: Int, in controller: ViewController)
    {
        FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize() + " (需要云加载)".localize(), for: UIControl.State.normal)
    }
    
    static func FontDataError(tag: Int, in controller: ViewController)
    {
        FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize() + " (数据错误)".localize(), for: UIControl.State.normal)
    }
    
    static func FontLoadFailed(tag: Int, in controller: ViewController)
    {
        FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize() + " (加载失败)".localize(), for: UIControl.State.normal)
    }
    
    static func FontLoading(percent: Int, tag: Int, in controller: ViewController)
    {
        FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize() + " (\(percent) %)", for: UIControl.State.normal)
    }
    
    static func FontLoaded(tag: Int, in controller: ViewController)
    {
        System.FeedbackGenerator(style: UIImpactFeedbackGenerator.FeedbackStyle.light)
        FontOperation(tag: tag, in: controller)
        FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize(), for: UIControl.State.normal)
        FontView.buttons[tag].titleLabel?.font = Font.set(fontName: Font.FontName.allValues[tag], size: 17)
    }
    
    static func FontOperation(tag: Int, in controller: ViewController)
    {
        if tag >= Font.FontName.allValues.count
        {
            return
        }
        
        if !Font.isExist(fontName: Font.FontName.allValues[tag])
        {
            if Downloader.loadingTag[tag]
            {
                KeyboardView.FontLoadCancelled(tag: tag, in: controller)
                Downloader.loadingTag[tag] = false
                Downloader.task[tag].suspend()
                Downloader.progressTimer[tag].invalidate()
                return
            }
            Downloader.loadFont(tag: tag, in: controller)
            FontView.buttons[tag].setTitle(Font.FontName.allValues[tag].rawValue.localize() + " (正在加载)".localize(), for: UIControl.State.normal)
            return
        }
        
        for oneButton in FontView.buttons
        {
            oneButton.isSelected = false
            oneButton.backgroundColor = Style.isDark ? Color.button.black.unSelectBG : Color.button.white.unSelectBG
        }
        FontView.buttons[tag].isSelected = true
        FontView.buttons[tag].backgroundColor = Style.isDark ? Color.button.black.SelectBG : Color.button.white.SelectBG
        
        /*let currentFrame = FontView.scrollView.convert(FontView.buttons[tag].frame, to: controller.PopView)
        print(currentFrame)
        if currentFrame.minY < 20 || currentFrame.maxY > Size.PopView.Height - 20
        {
            var offsetY = FontView.buttons[tag].frame.midY + Size.PopView.Height / 2.0
            offsetY = offsetY < 0 ? 0 : (offsetY > FontView.scrollView.contentOffset.y ? FontView.scrollView.contentOffset.y : offsetY)
            
            FontView.scrollView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)
        }*/
        //FontView.scrollView.scrollRectToVisible(FontView.buttons[tag].frame, animated: true)
        //FontView.scrollView.setContentOffset(CGPoint(x: 0, y: FontView.buttons[tag].frame.origin.y), animated: true)
        
        EditView.current.font = Font.FontName.allValues[tag]
        controller.TextBoxEditView.updateFont()
    }
    
    static func FontSizeOperation(tag: Int, in controller: ViewController)
    {
        switch tag
        {
        case FontSizeView.ID.SmallSize.rawValue:
            EditView.current.size = 24
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.MediumSize.rawValue:
            EditView.current.size = 30
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.LargeSize.rawValue:
            EditView.current.size = 40
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.LButton.rawValue:
            if EditView.current.size <= 10
            {
                return
            }
            EditView.current.size -= 2.0
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        case FontSizeView.ID.RButton.rawValue:
            if EditView.current.size >= 90
            {
                return
            }
            EditView.current.size += 2.0
            FontSizeView.SizeNumberLabel.text = String(Int(EditView.current.size))
            controller.TextBoxEditView.updateFont()
            
        default:
            break
        }
    }
    
    
}

