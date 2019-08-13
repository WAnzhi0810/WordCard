//
//  Font.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import Foundation
import UIKit


protocol EnumeratableEnumType
{
    static var allValues: [Self] {get}
}

class Font {
    
    enum FontName: String
    {
        case SongtiR = "STSongti-SC-Regular"
        case SongtiL = "STSongti-SC-Light"
        case SongtiB = "STSongti-SC-Bold"
        case SongtiBl = "STSongti-SC-Black"
        case SystemR = "System-Regular"
        case SystemL = "System-Light"
        case SystemUL = "System-UltraLight"
        case SystemB = "System-Bold"
        case SystemH = "System-Heavy"
        case SystemBl = "System-Black"
        case SourceHanSerifR = "SourceHanSerifSC-Regular"
        case SourceHanSerifL = "SourceHanSerifSC-Light"
        case SourceHanSerifM = "SourceHanSerifSC-Medium"
        case SourceHanSerifSB = "SourceHanSerifSC-SemiBold"
        case SourceHanSerifB = "SourceHanSerifSC-Bold"
        case SourceHanSerifH = "SourceHanSerifSC-Heavy"
    }
    
    static func set(systemFontSize size: CGFloat, weight: UIFont.Weight) -> UIFont
    {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    static func set(fontName: FontName, size: CGFloat) -> UIFont
    {
        switch fontName
        {
        case .SystemR:
            return self.set(systemFontSize: size, weight: UIFont.Weight.regular)
        case .SystemL:
            return self.set(systemFontSize: size, weight: UIFont.Weight.light)
        case .SystemUL:
            return self.set(systemFontSize: size, weight: UIFont.Weight.ultraLight)
        case .SystemB:
            return self.set(systemFontSize: size, weight: UIFont.Weight.bold)
        case .SystemH:
            return self.set(systemFontSize: size, weight: UIFont.Weight.heavy)
        case .SystemBl:
            return self.set(systemFontSize: size, weight: UIFont.Weight.black)
        default:
            break
        }
        return UIFont(name: fontName.rawValue, size: size)!
    }
    
    /*static func setFontAttr() -> [NSAttributedString.Key : UIFont]
    {
        
    }*/
    
    static func setTypingAttr(fontName: FontName, size: CGFloat) -> [String : Any]
    {
        let TypingAttr : [String : Any] =
            [
                "NSFont" : set(fontName: fontName, size: size),
                "NSColor" : Style.Adjustment.PreviewValue.FGColor[Style.Adjustment.current[.FGColor]!]
        ]
        
        return TypingAttr
    }
    
    static func setFontAttr(fontName: FontName, size: CGFloat, alignment: NSTextAlignment) -> [NSAttributedString.Key : Any]
    {
        return [NSAttributedString.Key.font : set(fontName: fontName, size: size),
                NSAttributedString.Key.paragraphStyle : Font.alignment(alignment: alignment),
                NSAttributedString.Key.foregroundColor : Style.Adjustment.PreviewValue.FGColor[Style.Adjustment.current[.FGColor]!]]
    }
    
    static func alignment(alignment: NSTextAlignment) -> NSParagraphStyle
    {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        
        return style
    }

}

extension Font.FontName: EnumeratableEnumType
{
    static var allValues: [Font.FontName]
    {
        return [.SongtiR, .SongtiL, .SongtiB, .SongtiBl, .SystemR, .SystemL, .SystemUL, .SystemB, .SystemH, .SystemBl, .SourceHanSerifR, .SourceHanSerifL, .SourceHanSerifM, .SourceHanSerifSB, .SourceHanSerifB, .SourceHanSerifH]
    }
}
