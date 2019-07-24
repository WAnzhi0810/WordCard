//
//  Style.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class Style {
    
    enum Name: Int
    {
        case Blank = 0
        case Picture = 1
    }
    static var current = Name.Blank
    
    class Adjustment
    {
        enum type: Int
        {
            case BGColor = 0
            case FGColor = 1
            case TextMargin = 2
        }
        static let typeArray: [type] = [.BGColor, .FGColor, .TextMargin]
        
        class current
        {
            static var BGColor = 0
            static var FGColor = 0
            static var TextMargin = 3
        }
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .TextMargin : PreviewValue.TextMargin]
        
        static let SectionTitle: [String] = ["背景颜色","文字颜色","文字边距"]
        
        static let CellSize: [type : CGSize] = [.BGColor : CGSize(width: 40.0, height: 40.0),
                                                .FGColor : CGSize(width: 40.0, height: 40.0),
                                                .TextMargin : CGSize(width: 60.0, height: 60.0)]
        
        class PreviewValue
        {
            static let BGColor = [UIColor.white,
                                  UIColor(hue: 0.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 1.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 2.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 3.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 4.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 5.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 6.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 7.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 8.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 9.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 10.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor(hue: 11.0/12.0, saturation: 0.3, brightness: 1, alpha: 1),
                                  UIColor.black]
            static let FGColor = [UIColor.black,
                                  UIColor(hue: 0.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 1.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 2.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 3.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 4.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 5.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 6.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 7.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 8.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 9.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 10.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor(hue: 11.0/12.0, saturation: 1, brightness: 0.3, alpha: 1),
                                  UIColor.white]
            static let TextMargin: [CGFloat] = [5, 10, 15, 20, 25, 30, 35, 40, 50]
        }
        
        
        static func cellInit(cell: UICollectionViewCell, typeItem: Int, selectionItem: Int)
        {
            switch typeItem
            {
            case type.BGColor.rawValue:
                cell.backgroundColor = PreviewValue.BGColor[selectionItem]
                cell.layer.cornerRadius = CellSize[.BGColor]!.height / 2.0
            case type.FGColor.rawValue:
                cell.backgroundColor = PreviewValue.FGColor[selectionItem]
                cell.layer.cornerRadius = CellSize[.FGColor]!.height / 2.0
            case type.TextMargin.rawValue:
                break
            default:
                break
            }
        }
        
        static func cellOperation(typeItem: Int, selectionItem: Int, in controller: ViewController)
        {
            switch typeItem
            {
            case type.BGColor.rawValue:
                self.current.BGColor = selectionItem
            case type.FGColor.rawValue:
                self.current.FGColor = selectionItem
            case type.TextMargin.rawValue:
                self.current.TextMargin = selectionItem
            default:
                break
            }
            
            self.Update(in: controller)
        }
        
        static func Update(in controller: ViewController)
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBox.backgroundColor = PreviewValue.BGColor[current.BGColor]
                controller.TextBoxLabel.textColor = PreviewValue.FGColor[current.FGColor]
                controller.TextBoxEditView.textColor = PreviewValue.FGColor[current.FGColor]
                
                controller.TextBoxLabelTop.constant = PreviewValue.TextMargin[current.TextMargin]
                controller.TextBoxLabelLeading.constant = PreviewValue.TextMargin[current.TextMargin]
                controller.TextBoxLabelBottom.constant = PreviewValue.TextMargin[current.TextMargin]
                controller.TextBoxLabelTrailing.constant = PreviewValue.TextMargin[current.TextMargin]
            }, completion: nil)
        }
        
    }
    
    
    
    
    
    
    
    
    static func GeneratePreviewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxStyle", for: indexPath)
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
    static func ChangeTo(item: Int, in controller: ViewController)
    {
        switch item
        {
        case Name.Blank.rawValue:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 0
            }, completion: nil)
            
        case Name.Picture.rawValue:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 1
            }, completion: nil)
            
        default:
            break
        }
    }
    
    static func UpdateTextBox(in controller: ViewController)
    {
        switch self.current
        {
        case .Blank, .Picture:
            let wordHeight = controller.TextBoxLabel.attributedText?.height(width: controller.TextBoxLabel.bounds.width)
            if wordHeight == nil
            {
                return
            }
            let boxHeight = wordHeight! + 20.0 * 2 <= Size.TextBox.Width ? Size.TextBox.Width : wordHeight! + 20.0 * 2
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxHeight.constant = boxHeight
                controller.TextBoxWidth.constant = Size.TextBox.Width
                controller.view.layoutIfNeeded()
            }, completion: nil)
            
            if self.current == .Picture
            {
                controller.TextBoxImageView.frame = CGRect(x: 0, y: 0, width: Size.TextBox.Width, height: boxHeight)
            }
            
            TextBox.UpdateTopToCenter(boxSize: CGSize(width: Size.TextBox.Width, height: boxHeight), in: controller)
        }
    }
    
    

}

extension Style.Name: EnumeratableEnumType
{
    static var allValues: [Style.Name]
    {
        return [.Blank, .Picture]
    }
}
