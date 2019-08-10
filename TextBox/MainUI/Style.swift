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
        case Postcard = 2
    }
    static let NameArray: [Name] = [.Blank, .Picture, .Postcard]
    static var current = Name.Blank
    
    static var isDark = false
    
    static let BoxStyleImage =
    { () -> [UIImage] in
        if isDark
        {
            return [UIImage(named: "Style1_b")!,
                    UIImage(named: "Style2_b")!,
                    UIImage(named: "Style3_b")!]
        }
        else
        {
            return [UIImage(named: "Style1_w")!,
                    UIImage(named: "Style2_w")!,
                    UIImage(named: "Style3_w")!]
        }
    }
    
    class temp
    {
        static var currentBlurImage: UIImage?
        static var currentMosaicImage: UIImage?
    }
    
    class Adjustment
    {
        enum type
        {
            case BGColor
            case FGColor
            case BGStyle
            case BoxSize
            case TextMargin
            case ImageMargin
            case ImageFilter
            case Image
            case ImageAlpha
            case BGImageAlpha
            case ImageShape
            case ImagePosition
            case ImageContentMode
        }
        
        static let typeArray: [type] = [.BoxSize, .BGColor, .FGColor, .BGStyle, .TextMargin, .ImageMargin, .ImageFilter, .Image, .ImageAlpha, .BGImageAlpha, .ImageShape, .ImagePosition, .ImageContentMode]
        
        static let displayType: [Style.Name : [Style.Adjustment.type]] =
                [.Blank : [.BGColor, .FGColor, .BoxSize, .TextMargin],
                 .Picture : [.Image, .ImageFilter, .ImageAlpha, .ImageContentMode, .BoxSize, .BGStyle, .BGImageAlpha, .BGColor, .FGColor, .ImageShape, .ImageMargin, .TextMargin],
                 .Postcard : [.Image, .ImageFilter, .ImageAlpha, .ImageContentMode, .ImagePosition, .BoxSize, .BGStyle, .BGImageAlpha, .BGColor, .FGColor, .ImageShape, .ImageMargin, .TextMargin]]
        
        static func displayTypeIndex(type: type, in name: Style.Name) -> Int?
        {
            return displayType[name]?.firstIndex(of: type)
        }
        
        static var current: [type : Int] = [.BGColor : 0,
                                            .FGColor : 0,
                                            .BGStyle : 2,
                                            .BoxSize : 1,
                                            .TextMargin : 2,
                                            .ImageMargin : 2,
                                            .ImageFilter : 6,
                                            .Image : 1,
                                            .ImageAlpha : 5,
                                            .BGImageAlpha : 1,
                                            .ImageShape: 0,
                                            .ImagePosition : 0,
                                            .ImageContentMode : 2]
        
        static var customImage = UIImage(named: "ImagePlaceholder")
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .BGStyle : PreviewValue.BGStyle,
                                                       .BoxSize : PreviewValue.BoxSize,
                                                       .TextMargin : PreviewValue.TextMargin,
                                                       .ImageMargin : PreviewValue.ImageMargin,
                                                       .ImageFilter : PreviewValue.ImageFilter,
                                                       .Image : PreviewValue.Image,
                                                       .ImageAlpha : PreviewValue.ImageAlpha,
                                                       .BGImageAlpha : PreviewValue.BGImageAlpha,
                                                       .ImageShape : PreviewValue.ImageShape(),
                                                       .ImagePosition : PreviewValue.ImagePosition,
                                                       .ImageContentMode : PreviewValue.ImageContentMode]
        
        static let SectionTitle: [type : String] = [.BGColor : "背景颜色".localize(),
                                                    .FGColor : "文字颜色".localize(),
                                                    .BGStyle : "背景样式".localize(),
                                                    .BoxSize : "卡片大小".localize(),
                                                    .TextMargin : "文字边距".localize(),
                                                    .ImageMargin : "图片边距".localize(),
                                                    .ImageFilter : "图片亮度".localize(),
                                                    .Image : "当前图片".localize(),
                                                    .ImageAlpha : "图片不透明度".localize(),
                                                    .BGImageAlpha : "背景图片不透明度".localize(),
                                                    .ImageShape : "图片形状".localize(),
                                                    .ImagePosition : "图片位置".localize(),
                                                    .ImageContentMode : "图片契合度".localize()]
        
        static let ImageContentModeString: [UIView.ContentMode : String] = [.scaleToFill : "拉伸".localize(),
                                                                            .scaleAspectFit : "适应".localize(),
                                                                            .scaleAspectFill : "填充".localize(),
                                                                            .left : "左".localize(),
                                                                            .topLeft : "左上".localize(),
                                                                            .bottomLeft : "左下".localize(),
                                                                            .top : "上".localize(),
                                                                            .center : "中心".localize(),
                                                                            .bottom : "下".localize(),
                                                                            .topRight : "右上".localize(),
                                                                            .bottomRight : "右下".localize(),
                                                                            .right : "右".localize()]
        
        static let CellSize: [type : CGSize] = [.BGColor : CGSize(width: 40.0, height: 40.0),
                                                .FGColor : CGSize(width: 40.0, height: 40.0),
                                                .BGStyle : CGSize(width: 80.0, height: 50.0),
                                                .BoxSize : CGSize(width: 80.0, height: 50.0),
                                                .TextMargin : CGSize(width: 70.0, height: 50.0),
                                                .ImageMargin : CGSize(width: 70.0, height: 50.0),
                                                .ImageFilter : CGSize(width: 70.0, height: 50.0),
                                                .Image : CGSize(width: 100.0, height: 100.0),
                                                .ImageAlpha : CGSize(width: 70.0, height: 50.0),
                                                .BGImageAlpha : CGSize(width: 70.0, height: 50.0),
                                                .ImageShape : CGSize(width: 100.0, height: 100.0),
                                                .ImagePosition : CGSize(width: 70.0, height: 50.0),
                                                .ImageContentMode : CGSize(width: 80.0, height: 50.0)]
        static let CellEdgeInset: [type : UIEdgeInsets] = [.BGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .FGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BGStyle : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BoxSize : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageFilter : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .Image : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageAlpha : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BGImageAlpha : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageShape : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImagePosition : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageContentMode : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)]
        static let TableCellHeight: [type : CGFloat] = [.BGColor : 40.0 * 2 + 30,
                                                        .FGColor : 40.0 * 2 + 30,
                                                        .BGStyle : 50.0 + 20,
                                                        .BoxSize : 50.0 + 20,
                                                        .TextMargin : 50.0 * 2 + 30,
                                                        .ImageMargin : 50.0 * 2 + 30,
                                                        .ImageFilter : 50.0 + 20,
                                                        .Image : 100.0 + 20,
                                                        .ImageAlpha : 50.0 + 20,
                                                        .BGImageAlpha : 50.0 + 20,
                                                        .ImageShape : 100.0 + 20,
                                                        .ImagePosition : 50.0 + 20,
                                                        .ImageContentMode : 50.0 * 3 + 40]
        
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
                                  UIColor.black,
                                  UIColor(white: 8.0/9.0, alpha: 1),
                                  UIColor(white: 7.0/9.0, alpha: 1),
                                  UIColor(white: 6.0/9.0, alpha: 1),
                                  UIColor(white: 5.0/9.0, alpha: 1),
                                  UIColor(white: 4.0/9.0, alpha: 1),
                                  UIColor(white: 3.0/9.0, alpha: 1),
                                  UIColor(white: 2.0/9.0, alpha: 1),
                                  UIColor(white: 1.0/9.0, alpha: 1)]
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
                                  UIColor.white,
                                  UIColor(white: 8.0/9.0, alpha: 1),
                                  UIColor(white: 7.0/9.0, alpha: 1),
                                  UIColor(white: 6.0/9.0, alpha: 1),
                                  UIColor(white: 5.0/9.0, alpha: 1),
                                  UIColor(white: 4.0/9.0, alpha: 1),
                                  UIColor(white: 3.0/9.0, alpha: 1),
                                  UIColor(white: 2.0/9.0, alpha: 1),
                                  UIColor(white: 1.0/9.0, alpha: 1)]
            static let BGStyle: [String] = ["纯色".localize(),
                                            "图片".localize(),
                                            "模糊".localize(),
                                            "马赛克".localize()]
            static let BoxSize: [CGFloat] = [400, 600, 1200]
            static let TextMargin: [CGFloat] = [10, 20, 40, 60, 80, 100, 120, 140, 160]
            static let ImageMargin: [CGFloat] = [0, 20, 40, 60, 80, 100, 120]
            static let ImageFilter: [Int] = [-6, -4, -2, 0, 2, 4, 6]
            static let Image: [UIImage] = [UIImage(named: "Image_add")!,
                                           UIImage(named: "image1")!,
                                           UIImage(named: "image2")!]
            static let ImageAlpha: [CGFloat] = [0, 0.2, 0.4, 0.6, 0.8, 1]
            static let BGImageAlpha: [CGFloat] = [0.2, 0.4, 0.6, 0.8, 1]
            static let ImageShape = { () -> [UIImage] in
                if Style.isDark
                {
                    return [UIImage(named: "ImageShape1_b")!,
                            UIImage(named: "ImageShape2_b")!]
                }
                else
                {
                    return [UIImage(named: "ImageShape1_w")!,
                            UIImage(named: "ImageShape2_w")!]
                }
            }
            static let ImagePosition: [String] = ["上".localize(),
                                                  "下".localize()]
            static let ImageContentMode: [UIView.ContentMode] = [.scaleToFill, .scaleAspectFit, .scaleAspectFill, .topLeft, .left, .bottomLeft, .top, .center, .bottom, .topRight, .right, .bottomRight]
            
            static let BackgroundViewColor = [UIColor.white,
                                              UIColor(hue: 0.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 1.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 2.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 3.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 4.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 5.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 6.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 7.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 8.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 9.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 10.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 11.0/12.0, saturation: 0.1, brightness: 0.9, alpha: 1),
                                              UIColor(hue: 0.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 1.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 2.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 3.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 4.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 5.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 6.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 7.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 8.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 9.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 10.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor(hue: 11.0/12.0, saturation: 0.2, brightness: 0.35, alpha: 1),
                                              UIColor.black]
        }
        
        
        static func cellInit(cell: AdjustmentSingleSelectionCell, typeItem: Int, selectionItem: Int)
        {
            cell.layer.borderColor = Color.selected.cgColor
            
            let currentType = self.displayType[Style.current]![typeItem]
            cell.label.text = ""
            cell.label.font = Font.set(systemFontSize: 24.0, weight: UIFont.Weight.medium)
            cell.image.contentMode = .scaleToFill
            cell.image.image = nil
            
            switch currentType
            {
            case type.BGColor:
                cell.backgroundColor = PreviewValue.BGColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                //cell.isSelected = selectionItem == self.current[.BGColor]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.BGColor]! ? 5.0 : 0.0
                //cell.layer.cornerRadius = CellSize[.BGColor]!.height / 2.0
            case type.FGColor:
                cell.backgroundColor = PreviewValue.FGColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                //cell.isSelected = selectionItem == self.current[.FGColor]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.FGColor]! ? 5.0 : 0.0
                //cell.layer.cornerRadius = CellSize[.FGColor]!.height / 2.0
            case type.BGStyle:
                cell.label.font = Font.set(systemFontSize: 20.0, weight: UIFont.Weight.medium)
                cell.label.text = PreviewValue.BGStyle[selectionItem]
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.BGStyle]! ? 5.0 : 0.0
            case type.BoxSize:
                cell.label.text = String(Int(PreviewValue.BoxSize[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.BoxSize]! ? 5.0 : 0.0
            case type.TextMargin:
                cell.label.text = String(Int(PreviewValue.TextMargin[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                //cell.isSelected = selectionItem == self.current[.TextMargin]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.TextMargin]! ? 5.0 : 0.0
            case type.ImageMargin:
                cell.label.text = String(Int(PreviewValue.ImageMargin[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                //cell.isSelected = selectionItem == self.current[.TextMargin]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.ImageMargin]! ? 5.0 : 0.0
            case type.ImageFilter:
                cell.label.text = String(PreviewValue.ImageFilter[selectionItem])
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                //cell.isSelected = selectionItem == self.current[.ImageFilter]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.ImageFilter]! ? 5.0 : 0.0
            case type.Image:
                cell.image.image = PreviewValue.Image[selectionItem]
                cell.layer.cornerRadius = 20.0
                //cell.isSelected = selectionItem == self.current[.Image]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.Image]! ? 5.0 : 0.0
            case type.ImageAlpha:
                cell.label.text = String(Float(PreviewValue.ImageAlpha[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImageAlpha]! ? 5.0 : 0.0
            case type.BGImageAlpha:
                cell.label.text = String(Float(PreviewValue.BGImageAlpha[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.BGImageAlpha]! ? 5.0 : 0.0
            case type.ImageShape:
                cell.image.image = PreviewValue.ImageShape()[selectionItem]
                cell.layer.cornerRadius = 20.0
                //cell.isSelected = selectionItem == self.current[.Image]! ? true : false
                cell.layer.borderWidth = selectionItem == self.current[.ImageShape]! ? 5.0 : 0.0
            case type.ImagePosition:
                cell.label.font = Font.set(systemFontSize: 20.0, weight: UIFont.Weight.medium)
                cell.label.text = PreviewValue.ImagePosition[selectionItem]
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImagePosition]! ? 5.0 : 0.0
            case type.ImageContentMode:
                cell.image.contentMode = PreviewValue.ImageContentMode[selectionItem]
                cell.label.font = Font.set(systemFontSize: 20.0, weight: UIFont.Weight.medium)
                cell.label.text = ImageContentModeString[PreviewValue.ImageContentMode[selectionItem]]
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImageContentMode]! ? 5.0 : 0.0
            }
        }
        
        static func cellOperation(typeItem: Int, selectionItem: Int, in controller: ViewController)
        {
            let currentType = self.displayType[Style.current]![typeItem]
            
            switch currentType
            {
            case type.BGColor:
                self.current[.BGColor] = selectionItem
            case type.FGColor:
                self.current[.FGColor] = selectionItem
            case type.BGStyle:
                self.current[.BGStyle] = selectionItem
            case type.BoxSize:
                self.current[.BoxSize] = selectionItem
            case type.TextMargin:
                self.current[.TextMargin] = selectionItem
            case type.ImageMargin:
                self.current[.ImageMargin] = selectionItem
            case type.ImageFilter:
                self.current[.ImageFilter] = selectionItem
            case type.Image:
                self.current[.Image] = selectionItem
                if selectionItem == 0
                {
                    controller.present(controller.photoPickerViewController, animated: true, completion: nil)
                }
            case type.ImageAlpha:
                self.current[.ImageAlpha] = selectionItem
            case type.BGImageAlpha:
                self.current[.BGImageAlpha] = selectionItem
            case type.ImageShape:
                self.current[.ImageShape] = selectionItem
            case type.ImagePosition:
                self.current[.ImagePosition] = selectionItem
            case type.ImageContentMode:
                self.current[.ImageContentMode] = selectionItem
            }
            
            self.Update(in: controller)
            Style.UpdateBackgroundAndDark(in: controller)
        }
        
        static func UpdateDarkCell(in controller: ViewController)
        {
            
            let darkableType: [Style.Adjustment.type] = [.BGStyle, .BoxSize, .TextMargin, .ImageAlpha, .BGImageAlpha, .ImageMargin, .ImageFilter, .ImageShape, .ImagePosition, .ImageContentMode]
            
            for onetype in darkableType
            {
                if let section = Style.Adjustment.displayTypeIndex(type: onetype, in: Style.current)
                {
                    let cell = controller.PopViewAdjustmentTableView.cellForRow(at: IndexPath(row: 0, section: section)) as? AdjustmentSelectionTypeCell
                    cell?.SingleSelectionCollectionView.reloadData()
                    //indexs.append(IndexPath(row: 0, section: section))
                }
            }
            
            /*let darkableTypes: [type] = [.BoxSize, .TextMargin, .ImageFilter, .ImageContentMode]
            
            for oneType in darkableTypes
            {
                let currentIndex = self.displayTypeIndex(type: oneType, in: Style.current)
                
                if currentIndex != nil
                {
                    for oneSelectionItem in 0...self.PreviewValueDict[oneType]!.count - 1
                    {
                        // 防止此 CollectionViewCell 因未查看整个 CollectionView 使其 Cell 全部加载而导致的无法找到该未加载的 CollectionViewCell 引起的程序崩溃
                        if !AdjustmentCell.isLoaded[currentIndex!][oneSelectionItem]
                        {
                            print("index: \(currentIndex!), item: \(oneSelectionItem) is not loaded")
                            continue
                        }
                        print("index: \(currentIndex!), item: \(oneSelectionItem) has changed")
                        AdjustmentCell.CollectionCell[currentIndex!][oneSelectionItem].label.textColor = Style.isDark ? UIColor.white : UIColor.black
                        AdjustmentCell.CollectionCell[currentIndex!][oneSelectionItem].backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                        /*if !AdjustmentCell.isLoaded[currentStyleTextMarginIndex!][oneSelectionItem]
                         {
                         continue
                         }
                         self.cellInit(cell: AdjustmentCell.CollectionCell[currentStyleTextMarginIndex!][oneSelectionItem], typeItem: currentStyleTextMarginIndex!, selectionItem: oneSelectionItem)*/
                    }
                }
            }*/
            
            
        }
        
        static func Update(in controller: ViewController)
        {
            Size.TextBox.size = PreviewValue.BoxSize[current[.BoxSize]!]
            
            switch Style.current
            {
            case .Blank, .Picture, .Postcard:
                Size.TextBox.scaleRatio = Size.TextBox.displayWidth / Size.TextBox.size
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    
                    controller.TextBoxLabelTop.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxLabelLeading.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxLabelBottom.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxLabelTrailing.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxEditViewTop.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxEditViewLeading.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxEditViewBottom.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    controller.TextBoxEditViewTrailing.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                    
                    controller.view.layoutIfNeeded()
                    
                }, completion: nil)
            }
            
            switch Style.current
            {
            case .Blank:
                break
            case .Picture, .Postcard:
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    controller.TextBoxImageView.alpha = PreviewValue.ImageAlpha[current[.ImageAlpha]!]
                    controller.TextBoxImageFilterView.alpha = PreviewValue.ImageAlpha[current[.ImageAlpha]!]
                    controller.TextBoxImageFilterView.backgroundColor = UIColor(white: PreviewValue.ImageFilter[current[.ImageFilter]!] >= 0 ? 1 : 0, alpha: CGFloat(abs(PreviewValue.ImageFilter[current[.ImageFilter]!])) / 10.0)
                    controller.TextBoxImageView.image = current[.Image] == 0 ? customImage ?? UIImage(named: "ImagePlaceholder") : PreviewValue.Image[current[.Image]!]
                    controller.TextBoxImageView.contentMode = PreviewValue.ImageContentMode[current[.ImageContentMode]!]
                    controller.TextBoxImageViewTop.constant = PreviewValue.ImageMargin[current[.ImageMargin]!]
                    controller.TextBoxImageViewLeading.constant = PreviewValue.ImageMargin[current[.ImageMargin]!]
                    controller.TextBoxImageViewBottom.constant = PreviewValue.ImageMargin[current[.ImageMargin]!]
                    controller.TextBoxImageViewTrailing.constant = PreviewValue.ImageMargin[current[.ImageMargin]!]
                    
                    controller.view.layoutIfNeeded()
                }, completion: nil)
            }
            
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                
                controller.TextBoxShadowView.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBoxContent.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBoxLabel.textColor = PreviewValue.FGColor[current[.FGColor]!]
                controller.TextBoxEditView.textColor = PreviewValue.FGColor[current[.FGColor]!]
                
                controller.view.layoutIfNeeded()
                
                controller.TextBox.adaptiveScaling()
                Style.UpdateTextBox(in: controller)
                
            }) { (true) in
                
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    static func GeneratePreviewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxStyle", for: indexPath) as! BoxStyle
        cell.backgroundColor = UIColor.white
        
        cell.image.image = self.BoxStyleImage()[indexPath.item]
        cell.layer.borderColor = Color.selected.cgColor
        cell.layer.borderWidth = indexPath.item == self.current.rawValue ? 5.0 : 0.0
        
        //ModelCell.CollectionCell[indexPath.item] = cell
        
        return cell
    }
    static func ChangeTo(item: Int, in controller: ViewController)
    {
        self.current = self.NameArray[item]
        
        /*for (n, cell) in ModelCell.CollectionCell.enumerated()
        {
            cell.layer.borderWidth = n == item ? 5.0 : 0.0
        }*/
        
        self.UpdateStyle(in: controller)
        self.Adjustment.Update(in: controller)
        self.UpdateBackgroundAndDark(in: controller)
    }
    
    static func UpdateStyle(in controller: ViewController)
    {
        switch self.current
        {
        case Name.Blank:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 0
                controller.TextBoxImageFilterView.alpha = 0
                controller.BackgroundImageView.alpha = 0
                controller.BackgroundEffectView.effect = nil
                controller.TextBoxBackgroundImageView.alpha = 0
            }, completion: nil)
            
        case Name.Picture:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.TextBoxImageFilterView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.BackgroundImageView.alpha = 1
            }, completion: nil)
            
        case Name.Postcard:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.TextBoxImageFilterView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.BackgroundImageView.alpha = 1
            }, completion: nil)
        }
    }
    
    static func UpdateTextBox(in controller: ViewController)
    {
        switch self.current
        {
        case .Blank, .Picture:
            let currentImageShape = self.Adjustment.current[.ImageShape]!
            let currentImageMargin = self.Adjustment.PreviewValue.ImageMargin[self.Adjustment.current[.ImageMargin]!]
            
            let wordHeight = controller.TextBoxLabel.attributedText?.height(width: Size.TextBox.size - (controller.TextBoxLabelLeading.constant + controller.TextBoxLabelTrailing.constant))
            if wordHeight == nil
            {
                return
            }
            let boxHeight = wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant <= Size.TextBox.size ? Size.TextBox.size : wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant + 1
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxHeight.constant = boxHeight
                controller.TextBoxWidth.constant = Size.TextBox.size
                controller.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                switch currentImageShape
                {
                case 0:
                    controller.TextBoxImageView.layer.cornerRadius = 0
                    controller.TextBoxImageFilterView.layer.cornerRadius = 0
                case 1:
                    controller.TextBoxImageView.layer.cornerRadius = (Size.TextBox.size - currentImageMargin * 2.0) / 2.0
                    controller.TextBoxImageFilterView.layer.cornerRadius = (Size.TextBox.size - currentImageMargin * 2.0) / 2.0
                default:
                    break
                }
                
            }, completion: nil)
            
            TextBox.UpdateToCenter(boxSize: CGSize(width: Size.TextBox.size, height: boxHeight), in: controller)
            
        case .Postcard:
            let currentTextMargin = self.Adjustment.PreviewValue.TextMargin[self.Adjustment.current[.TextMargin]!]
            let currentImageMargin = self.Adjustment.PreviewValue.ImageMargin[self.Adjustment.current[.ImageMargin]!]
            let currentImageShape = self.Adjustment.current[.ImageShape]!
            
            let wordHeight = controller.TextBoxLabel.attributedText?.height(width: Size.TextBox.size - (controller.TextBoxLabelLeading.constant + controller.TextBoxLabelTrailing.constant))
            if wordHeight == nil
            {
                return
            }
            let wordPart = wordHeight! + currentTextMargin * 2 <= Size.TextBox.size / 2.0 ? Size.TextBox.size / 2.0 : wordHeight! + currentTextMargin * 2
            let picPart = Size.TextBox.size - currentImageMargin
            let boxHeight = wordPart + picPart + 1
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.TextBoxImageFilterView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                if self.Adjustment.current[.ImagePosition] == 0
                {
                    controller.TextBoxImageViewTop.constant = currentImageMargin
                    controller.TextBoxLabelBottom.constant = currentTextMargin
                    controller.TextBoxImageViewBottom.constant = wordPart
                    controller.TextBoxLabelTop.constant = picPart + currentTextMargin
                }
                else if self.Adjustment.current[.ImagePosition] == 1
                {
                    controller.TextBoxImageViewBottom.constant = currentImageMargin
                    controller.TextBoxLabelTop.constant = currentTextMargin
                    controller.TextBoxImageViewTop.constant = wordPart
                    controller.TextBoxLabelBottom.constant = picPart + currentTextMargin
                }
                controller.TextBoxHeight.constant = boxHeight
                controller.TextBoxWidth.constant = Size.TextBox.size
                controller.view.layoutIfNeeded()
            }, completion: nil)
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                switch currentImageShape
                {
                case 0:
                    controller.TextBoxImageView.layer.cornerRadius = 0
                    controller.TextBoxImageFilterView.layer.cornerRadius = 0
                case 1:
                    controller.TextBoxImageView.layer.cornerRadius = (Size.TextBox.size - currentImageMargin * 2.0) / 2.0
                    controller.TextBoxImageFilterView.layer.cornerRadius = (Size.TextBox.size - currentImageMargin * 2.0) / 2.0
                default:
                    break
                }
                
            }, completion: nil)
            
            TextBox.UpdateToCenter(boxSize: CGSize(width: Size.TextBox.size, height: boxHeight), in: controller)
        }
    }
    
    
    static func UpdateBackgroundAndDark(in controller: ViewController)
    {
        switch Style.current
        {
        case .Blank:
            let bgc = self.Adjustment.current[.BGColor]!
            let fgc = self.Adjustment.current[.FGColor]!
            
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                if bgc == 0 || bgc == 26 || bgc == 27 || bgc == 28 || bgc == 29
                {
                    if fgc == 0 || fgc >= 25
                    {
                        controller.BackgroundView.backgroundColor = Color.AppColor
                    }
                    else
                    {
                        controller.BackgroundView.backgroundColor = Style.Adjustment.PreviewValue.BackgroundViewColor[fgc>=13 ? fgc-12 : fgc]
                    }
                }
                else if bgc == 25 || bgc == 30 || bgc == 31 || bgc == 32 || bgc == 33
                {
                    if fgc == 0 || fgc >= 25
                    {
                        controller.BackgroundView.backgroundColor = Color.AppColorDark
                    }
                    else
                    {
                        controller.BackgroundView.backgroundColor = Style.Adjustment.PreviewValue.BackgroundViewColor[fgc<13 ? fgc+12 : fgc]
                    }
                }
                else
                {
                    controller.BackgroundView.backgroundColor = Style.Adjustment.PreviewValue.BackgroundViewColor[bgc<=10 ? bgc+2 : (bgc<=12 ? bgc-10 : bgc)]
                }
            }, completion: nil)
            
            self.UpdateDark(isDark: bgc<13 ? false : ((bgc>=26 && bgc<=29) ? false : true), in: controller)
            
        case .Picture, .Postcard:
            controller.BackgroundImageView.image = controller.TextBoxImageView.image
            self.UpdateDark(isDark: self.Adjustment.PreviewValue.ImageFilter[self.Adjustment.current[.ImageFilter]!] >= 0 ? false : true, in: controller)
        }
    }
    
    
    static func UpdateDark(isDark: Bool, in controller: ViewController)
    {
        self.isDark = isDark
        
        controller.ChangeStatusBarStyle(isChangeToBlack: !isDark, duration: Constant.AnimationInterval.Middle)
        
        switch self.current
        {
        case .Blank:
            break
        case .Picture, .Postcard:
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.BackgroundEffectView.effect = UIBlurEffect(style: isDark ? .dark : .light)
                if self.Adjustment.current[.BGStyle]! == 0
                {
                    controller.TextBoxBackgroundImageView.alpha = 0
                }
                else if self.Adjustment.current[.BGStyle]! == 1
                {
                    temp.currentBlurImage = nil
                    temp.currentMosaicImage = nil
                    controller.TextBoxBackgroundImageView.image = controller.TextBoxImageView.image
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                }
                else if self.Adjustment.current[.BGStyle]! == 2
                {
                    temp.currentMosaicImage = nil
                    if controller.TextBoxBackgroundImageView.alpha == 0 || temp.currentBlurImage != controller.TextBoxImageView.image
                    {
                        temp.currentBlurImage = controller.TextBoxImageView.image
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getGaussianBlur(blurRadius: 30))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                }
                else if self.Adjustment.current[.BGStyle]! == 3
                {
                    temp.currentBlurImage = nil
                    if controller.TextBoxBackgroundImageView.alpha == 0 || temp.currentMosaicImage != controller.TextBoxImageView.image
                    {
                        temp.currentMosaicImage = controller.TextBoxImageView.image
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getMosaic(value: 30))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                }
                
            }, completion: nil)
        }
        
        if isDark
        {
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.PopBackgroundView.backgroundColor = UIColor.init(white: 0.1, alpha: 1)
            }, completion: nil)
            Color.theme.current = UIColor.white
            controller.ModelButton.setImage(UIImage(named: "Model_w"), for: .normal)
            controller.AdjustmentButton.setImage(UIImage(named: "Adjustment_w"), for: .normal)
            controller.ShareButton.setImage(UIImage(named: "Export_w"), for: .normal)
            controller.CloseButton.setImage(UIImage(named: "X_w"), for: .normal)
            
            controller.TextBoxEditView.keyboardAppearance = .dark
        }
        else
        {
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.PopBackgroundView.backgroundColor = UIColor.groupTableViewBackground
            }, completion: nil)
            Color.theme.current = UIColor.black
            controller.ModelButton.setImage(UIImage(named: "Model_b"), for: .normal)
            controller.AdjustmentButton.setImage(UIImage(named: "Adjustment_b"), for: .normal)
            controller.ShareButton.setImage(UIImage(named: "Export_b"), for: .normal)
            controller.CloseButton.setImage(UIImage(named: "X_b"), for: .normal)
            
            controller.TextBoxEditView.keyboardAppearance = .light
        }
        
        controller.PopViewModelCollectionView.reloadData()
        EditAccessoryView.UpdateDark()
        
        /*
        //var indexs = [IndexPath]()
        let darkableType: [Style.Adjustment.type] = [.BoxSize, .TextMargin, .ImageFilter, .ImageContentMode]
        
        for onetype in darkableType
        {
            if let section = self.Adjustment.displayTypeIndex(type: onetype, in: self.current)
            {
                let cell = controller.PopViewAdjustmentTableView.cellForRow(at: IndexPath(row: 0, section: section)) as? AdjustmentSelectionTypeCell
                cell?.SingleSelectionCollectionView.reloadData()
                //indexs.append(IndexPath(row: 0, section: section))
            }
        }
        
        if indexs.count != 0
        {
            controller.PopViewAdjustmentTableView.reloadRows(at: indexs, with: UITableView.RowAnimation.none)
        }*/
        
        self.Adjustment.UpdateDarkCell(in: controller)
        
    }
    
    
    static func ToEdit(in controller: ViewController)
    {
        switch self.current
        {
        case .Blank, .Picture:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxHeight.constant = Size.TextBox.size
                controller.TextBoxWidth.constant = Size.TextBox.size
                controller.view.layoutIfNeeded()
            }, completion: nil)
        case .Postcard:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 0
                controller.TextBoxImageFilterView.alpha = 0
                controller.TextBoxHeight.constant = Size.TextBox.size
                controller.TextBoxWidth.constant = Size.TextBox.size
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    

}

extension Style.Name: EnumeratableEnumType
{
    static var allValues: [Style.Name]
    {
        return [.Blank, .Picture, .Postcard]
    }
}
