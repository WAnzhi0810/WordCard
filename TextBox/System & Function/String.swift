//
//  String.swift
//  TextBox
//
//  Created by OX CL on 2019/7/17.
//  Copyright © 2019 OX CL. All rights reserved.
//

import Foundation
import UIKit


extension String
{
    func localize() -> String
    {
        return NSLocalizedString(self, comment: "")
    }
    
    func getThisParagraph(range: NSRange) -> (Range: NSRange, Content: String)
    {
        let strBefore = self[..<self.utf16.index(self.startIndex,offsetBy: range.location)]
        let ParaBeginIndex: Int
        let ParaEndIndex: Int
        let BeforeLength: Int
        let AfterLength: Int
        let strResult: String
        let reverse = String(strBefore.reversed())
        
        if let index = reverse.index(of: "\n")
        {
            var str1 = reverse[..<index]
            str1 = String.SubSequence(str1.reversed())
            ParaBeginIndex = reverse[index..<reverse.endIndex].utf16.count
            BeforeLength = strBefore.utf16.distance(from: strBefore.utf16.index(strBefore.startIndex, offsetBy: ParaBeginIndex), to: strBefore.endIndex)
        }
        else
        {
            ParaBeginIndex = 0
            BeforeLength = strBefore.utf16.distance(from: strBefore.startIndex, to: strBefore.endIndex)
        }
        
        
        let strAfter = self[self.utf16.index(self.startIndex, offsetBy: range.location + range.length)..<self.endIndex]
        if let index1 = strAfter.index(of: "\n")
        {
            AfterLength = strAfter.utf16.distance(from: strAfter.startIndex, to: index1)
            ParaEndIndex = ParaBeginIndex + BeforeLength + AfterLength
            //strResult = String(strAfter[strAfter.startIndex..<index1])//.trimmingCharacters(in: NSCharacterSet.whitespaces)
        }
        else
        {
            ParaEndIndex = self.utf16.count
            //strResult = String(strAfter)//.trimmingCharacters(in: NSCharacterSet.whitespaces)
        }
        
        strResult = ParaBeginIndex < ParaEndIndex ? String(self[self.utf16.index(self.startIndex, offsetBy: ParaBeginIndex)...self.utf16.index(self.startIndex, offsetBy: ParaEndIndex-1)]) : ""
        
        print((ParaBeginIndex, ParaEndIndex, strResult))
        return (Range: NSMakeRange(ParaBeginIndex, ParaEndIndex-ParaBeginIndex), Content: strResult)
    }
}


extension NSAttributedString
{
    func height(width: CGFloat) -> CGFloat
    {
        return self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).height
    }
    
    func width(height: CGFloat) -> CGFloat
    {
        return self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).width
    }
}

