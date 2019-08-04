//
//  EditView.swift
//  TextBox
//
//  Created by OX CL on 2019/7/17.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class EditView: UITextView {
    
    class current
    {
        static var font = Font.FontName.SongtiR
        static var size: CGFloat = 30
        static var alignment = NSTextAlignment.center
    }
    
    func FontInit()
    {
        self.setTypingAttr(fontName: current.font, size: current.size, textAlignment: current.alignment)
    }
    
    func setTypingAttr(fontName: Font.FontName?, size: CGFloat?, textAlignment: NSTextAlignment?)
    {
        self.typingAttributes = Font.setFontAttr(fontName: fontName ?? current.font, size: size ?? current.size, alignment: textAlignment ?? current.alignment)
    }

    func setAlignment(textAlignment: NSTextAlignment)
    {
        self.textStorage.addAttribute(NSAttributedString.Key.paragraphStyle, value: Font.alignment(alignment: textAlignment), range: self.text.getThisParagraph(range: self.selectedRange).Range)
        self.setTypingAttr(fontName: nil, size: nil, textAlignment: textAlignment)
    }
    
    func updateFont()
    {
        self.font = Font.set(fontName: current.font, size: current.size)
    }
    
    func GetAndSetCurrentAlignment()
    {
        if self.text.count == 0
        {
            return
        }
        var checkPoint = self.text.getThisParagraph(range: self.selectedRange).Range.location
        checkPoint = checkPoint >= self.text.utf16.count ? self.text.utf16.count-1 : checkPoint
        
        guard let currentParaStyle = self.attributedText.attribute(NSAttributedString.Key.paragraphStyle, at: checkPoint, effectiveRange: nil) as? NSParagraphStyle else {
            return
        }
        
        switch currentParaStyle.alignment
        {
        case .left:
            EditAccessoryView.ButtonSelectOperation(sender: EditAccessoryView.button.LeftAlign)
        case .center:
            EditAccessoryView.ButtonSelectOperation(sender: EditAccessoryView.button.CenterAlign)
        case .right:
            EditAccessoryView.ButtonSelectOperation(sender: EditAccessoryView.button.RightAlign)
        default:
            break
        }
        self.setAlignment(textAlignment: currentParaStyle.alignment)
    }

}
