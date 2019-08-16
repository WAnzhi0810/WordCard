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
        case HorizontalPostcard = 3
    }
    static let NameArray: [Name] = [.Blank, .Picture, .Postcard, .HorizontalPostcard]
    static var current = Name.Blank
    
    static var isDark = false
    
    static let BoxStyleImage =
    { () -> [UIImage] in
        if isDark
        {
            return [UIImage(named: "Style1_b")!,
                    UIImage(named: "Style2_b")!,
                    UIImage(named: "Style3_b")!,
                    UIImage(named: "Style4_b")!]
        }
        else
        {
            return [UIImage(named: "Style1_w")!,
                    UIImage(named: "Style2_w")!,
                    UIImage(named: "Style3_w")!,
                    UIImage(named: "Style4_w")!]
        }
    }
    
    class currentFilterImage
    {
        static var image: UIImage?
        static var filter: Adjustment.PreviewValue.Filter = Adjustment.PreviewValue.BGStyle[Adjustment.current[.BGStyle]!].filter
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
            case TextBorderColor
            case TextBorderWidth
            case ImageBorderColor
            case ImageBorderWidth
            case ImageFilter
            case Image
            case ImageAlpha
            case BGImageAlpha
            case ImageShape
            case ImagePositionTB
            case ImagePositionLT
            case ImageContentMode
        }
        
        static let typeArray: [type] = [.BoxSize, .BGColor, .FGColor, .BGStyle, .TextMargin, .ImageMargin, .TextBorderColor, .TextBorderWidth, .ImageBorderColor, .ImageBorderWidth, .ImageFilter, .Image, .ImageAlpha, .BGImageAlpha, .ImageShape, .ImagePositionTB, .ImagePositionLT, .ImageContentMode]
        
        static let displayType: [Style.Name : [Style.Adjustment.type]] =
                [.Blank : [.BGColor, .FGColor, .BoxSize, .TextMargin, .TextBorderColor, .TextBorderWidth],
                 .Picture : [.Image, .ImageFilter, .BoxSize, .ImageAlpha, .ImageContentMode, .ImageShape, .ImageMargin, .ImageBorderColor, .ImageBorderWidth, .TextMargin, .TextBorderColor, .TextBorderWidth, .FGColor, .BGStyle, .BGImageAlpha, .BGColor],
                 .Postcard : [.Image, .ImageFilter, .BoxSize, .ImageAlpha, .ImageContentMode, .ImageShape, .ImagePositionTB, .ImageMargin, .ImageBorderColor, .ImageBorderWidth, .TextMargin, .FGColor, .BGStyle, .BGImageAlpha, .BGColor],
                 .HorizontalPostcard : [.Image, .ImageFilter, .BoxSize, .ImageAlpha, .ImageContentMode, .ImageShape, .ImagePositionLT, .ImageMargin, .ImageBorderColor, .ImageBorderWidth, .TextMargin, .FGColor, .BGStyle, .BGImageAlpha, .BGColor]]
        
        static func displayTypeIndex(type: type, in name: Style.Name) -> Int?
        {
            return displayType[name]?.firstIndex(of: type)
        }
        
        static var current: [type : Int] = [.BGColor : 0,
                                            .FGColor : 0,
                                            .BGStyle : 0,
                                            .BoxSize : 1,
                                            .TextMargin : 2,
                                            .ImageMargin : 2,
                                            .TextBorderColor : 0,
                                            .TextBorderWidth : 0,
                                            .ImageBorderColor : 0,
                                            .ImageBorderWidth : 0,
                                            .ImageFilter : 6,
                                            .Image : 1,
                                            .ImageAlpha : 5,
                                            .BGImageAlpha : 1,
                                            .ImageShape: 0,
                                            .ImagePositionTB : 0,
                                            .ImagePositionLT : 0,
                                            .ImageContentMode : 2]
        
        static var customImage = UIImage(named: "ImagePlaceholder")
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .BGStyle : PreviewValue.BGStyle,
                                                       .BoxSize : PreviewValue.BoxSize,
                                                       .TextMargin : PreviewValue.TextMargin,
                                                       .ImageMargin : PreviewValue.ImageMargin,
                                                       .TextBorderColor : PreviewValue.TextBorderColor,
                                                       .TextBorderWidth : PreviewValue.TextBorderWidth,
                                                       .ImageBorderColor : PreviewValue.ImageBorderColor,
                                                       .ImageBorderWidth : PreviewValue.ImageBorderWidth,
                                                       .ImageFilter : PreviewValue.ImageFilter,
                                                       .Image : PreviewValue.Image,
                                                       .ImageAlpha : PreviewValue.ImageAlpha,
                                                       .BGImageAlpha : PreviewValue.BGImageAlpha,
                                                       .ImageShape : PreviewValue.ImageShape(),
                                                       .ImagePositionTB : PreviewValue.ImagePositionTB,
                                                       .ImagePositionLT : PreviewValue.ImagePositionLT,
                                                       .ImageContentMode : PreviewValue.ImageContentMode]
        
        static let SectionTitle: [type : String] = [.BGColor : "背景颜色".localize(),
                                                    .FGColor : "文字颜色".localize(),
                                                    .BGStyle : "背景样式".localize(),
                                                    .BoxSize : "卡片大小".localize(),
                                                    .TextMargin : "文字边距".localize(),
                                                    .ImageMargin : "图片边距".localize(),
                                                    .TextBorderColor : "文字装饰框颜色".localize(),
                                                    .TextBorderWidth : "文字装饰框粗细度".localize(),
                                                    .ImageBorderColor : "图片装饰框颜色".localize(),
                                                    .ImageBorderWidth : "图片装饰框粗细度".localize(),
                                                    .ImageFilter : "图片亮度".localize(),
                                                    .Image : "当前图片".localize(),
                                                    .ImageAlpha : "图片不透明度".localize(),
                                                    .BGImageAlpha : "背景图片不透明度".localize(),
                                                    .ImageShape : "图片形状".localize(),
                                                    .ImagePositionTB : "图片位置".localize(),
                                                    .ImagePositionLT : "图片位置".localize(),
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
                                                .BGStyle : CGSize(width: 120.0, height: 50.0),
                                                .BoxSize : CGSize(width: 80.0, height: 50.0),
                                                .TextMargin : CGSize(width: 70.0, height: 50.0),
                                                .ImageMargin : CGSize(width: 70.0, height: 50.0),
                                                .TextBorderColor : CGSize(width: 40.0, height: 40.0),
                                                .TextBorderWidth : CGSize(width: 70.0, height: 50.0),
                                                .ImageBorderColor : CGSize(width: 40.0, height: 40.0),
                                                .ImageBorderWidth : CGSize(width: 70.0, height: 50.0),
                                                .ImageFilter : CGSize(width: 70.0, height: 50.0),
                                                .Image : CGSize(width: 100.0, height: 100.0),
                                                .ImageAlpha : CGSize(width: 70.0, height: 50.0),
                                                .BGImageAlpha : CGSize(width: 70.0, height: 50.0),
                                                .ImageShape : CGSize(width: 100.0, height: 100.0),
                                                .ImagePositionTB : CGSize(width: 70.0, height: 50.0),
                                                .ImagePositionLT : CGSize(width: 70.0, height: 50.0),
                                                .ImageContentMode : CGSize(width: 80.0, height: 50.0)]
        static let CellEdgeInset: [type : UIEdgeInsets] = [.BGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .FGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BGStyle : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BoxSize : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextBorderColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextBorderWidth : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageBorderColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageBorderWidth : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageFilter : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .Image : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageAlpha : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BGImageAlpha : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageShape : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImagePositionTB : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImagePositionLT : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageContentMode : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)]
        static let TableCellHeight: [type : CGFloat] = [.BGColor : 40.0 * 2 + 30,
                                                        .FGColor : 40.0 * 2 + 30,
                                                        .BGStyle : 50.0 * 2 + 30,
                                                        .BoxSize : 50.0 + 20,
                                                        .TextMargin : 50.0 * 2 + 30,
                                                        .ImageMargin : 50.0 * 2 + 30,
                                                        .TextBorderColor : 40.0 * 2 + 30,
                                                        .TextBorderWidth : 50.0 * 2 + 30,
                                                        .ImageBorderColor : 40.0 * 2 + 30,
                                                        .ImageBorderWidth : 50.0 * 2 + 30,
                                                        .ImageFilter : 50.0 + 20,
                                                        .Image : 100.0 + 20,
                                                        .ImageAlpha : 50.0 + 20,
                                                        .BGImageAlpha : 50.0 + 20,
                                                        .ImageShape : 100.0 + 20,
                                                        .ImagePositionTB : 50.0 + 20,
                                                        .ImagePositionLT : 50.0 + 20,
                                                        .ImageContentMode : 50.0 * 3 + 40]
        
        class PreviewValue
        {
            static let BGColor = Color.Background
            static let FGColor = Color.Foreground
            enum Filter
            {
                case pure
                case picture
                case blur
                case pixellate
                case pointillize
                case edge
                case hexagon
            }
            static let BGStyle: [(filter: Filter, discribe: String)] = [(.pure, "纯色".localize()),
                                                                        (.picture, "图片".localize()),
                                                                        (.blur, "模糊".localize()),
                                                                        (.pixellate, "像素化".localize()),
                                                                        (.pointillize, "点状化".localize()),
                                                                        (.edge, "边缘化".localize()),
                                                                        (.hexagon, "六边形".localize())]
            static let BoxSize: [CGFloat] = [400, 600, 1200]
            static let TextMargin: [CGFloat] = [10, 20, 40, 60, 80, 100, 120, 140, 160]
            static let ImageMargin: [CGFloat] = [0, 20, 40, 60, 80, 100, 120]
            static let TextBorderColor = Color.Foreground
            static let TextBorderWidth: [CGFloat] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
            static let ImageBorderColor = Color.Foreground
            static let ImageBorderWidth: [CGFloat] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
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
            static let ImagePositionTB: [String] = ["上".localize(),
                                                  "下".localize()]
            static let ImagePositionLT: [String] = ["左".localize(),
                                                    "右".localize()]
            static let ImageContentMode: [UIView.ContentMode] = [.scaleToFill, .scaleAspectFit, .scaleAspectFill, .topLeft, .left, .bottomLeft, .top, .center, .bottom, .topRight, .right, .bottomRight]
            
            static let BackgroundViewColor = Color.BackgroundView
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
                cell.label.text = PreviewValue.BGStyle[selectionItem].discribe
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
            case type.TextBorderColor:
                cell.backgroundColor = PreviewValue.TextBorderColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                cell.layer.borderWidth = selectionItem == self.current[.TextBorderColor]! ? 5.0 : 0.0
            case type.TextBorderWidth:
                cell.label.text = String(Int(PreviewValue.TextBorderWidth[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.TextBorderWidth]! ? 5.0 : 0.0
            case type.ImageBorderColor:
                cell.backgroundColor = PreviewValue.ImageBorderColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                cell.layer.borderWidth = selectionItem == self.current[.ImageBorderColor]! ? 5.0 : 0.0
            case type.ImageBorderWidth:
                cell.label.text = String(Int(PreviewValue.ImageBorderWidth[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImageBorderWidth]! ? 5.0 : 0.0
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
            case type.ImagePositionTB:
                cell.label.font = Font.set(systemFontSize: 20.0, weight: UIFont.Weight.medium)
                cell.label.text = PreviewValue.ImagePositionTB[selectionItem]
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImagePositionTB]! ? 5.0 : 0.0
            case type.ImagePositionLT:
                cell.label.font = Font.set(systemFontSize: 20.0, weight: UIFont.Weight.medium)
                cell.label.text = PreviewValue.ImagePositionLT[selectionItem]
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImagePositionLT]! ? 5.0 : 0.0
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
            case type.TextBorderColor:
                self.current[.TextBorderColor] = selectionItem
            case type.TextBorderWidth:
                self.current[.TextBorderWidth] = selectionItem
            case type.ImageBorderColor:
                self.current[.ImageBorderColor] = selectionItem
            case type.ImageBorderWidth:
                self.current[.ImageBorderWidth] = selectionItem
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
            case type.ImagePositionTB:
                self.current[.ImagePositionTB] = selectionItem
            case type.ImagePositionLT:
                self.current[.ImagePositionLT] = selectionItem
            case type.ImageContentMode:
                self.current[.ImageContentMode] = selectionItem
            }
            
            self.Update(in: controller)
            Style.UpdateBackgroundAndDark(in: controller)
        }
        
        static func UpdateDarkCell(in controller: ViewController)
        {
            
            let darkableType: [Style.Adjustment.type] = [.BGStyle, .BoxSize, .TextMargin, .TextBorderWidth, .ImageBorderWidth, .ImageAlpha, .BGImageAlpha, .ImageMargin, .ImageFilter, .ImageShape, .ImagePositionTB, .ImagePositionLT, .ImageContentMode]
            
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
            case .Blank, .Picture, .Postcard, .HorizontalPostcard:
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
            case .Blank, .Picture:
                controller.TextBoxLabel.layer.borderColor = PreviewValue.TextBorderColor[current[.TextBorderColor]!].cgColor
                controller.TextBoxLabel.layer.borderWidth = PreviewValue.TextBorderWidth[current[.TextBorderWidth]!]
                
            case .Postcard, .HorizontalPostcard:
                controller.TextBoxLabel.layer.borderWidth = 0
            }
            
            switch Style.current
            {
            case .Blank:
                break
            case .Picture, .Postcard, .HorizontalPostcard:
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
                    
                    controller.TextBoxImageFilterView.layer.borderColor = PreviewValue.ImageBorderColor[current[.ImageBorderColor]!].cgColor
                    controller.TextBoxImageFilterView.layer.borderWidth = PreviewValue.ImageBorderWidth[current[.ImageBorderWidth]!]
                    
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
        case .Blank:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 0
                controller.TextBoxImageFilterView.alpha = 0
                controller.BackgroundImageView.alpha = 0
                controller.BackgroundEffectView.effect = nil
                controller.TextBoxBackgroundImageView.alpha = 0
            }, completion: nil)
            
        case .Picture, .Postcard, .HorizontalPostcard:
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
                if self.Adjustment.current[.ImagePositionTB] == 0
                {
                    controller.TextBoxImageViewTop.constant = currentImageMargin
                    controller.TextBoxLabelBottom.constant = currentTextMargin
                    controller.TextBoxImageViewBottom.constant = wordPart
                    controller.TextBoxLabelTop.constant = picPart + currentTextMargin
                }
                else if self.Adjustment.current[.ImagePositionTB] == 1
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
            
        case .HorizontalPostcard:
            let currentTextMargin = self.Adjustment.PreviewValue.TextMargin[self.Adjustment.current[.TextMargin]!]
            let currentImageMargin = self.Adjustment.PreviewValue.ImageMargin[self.Adjustment.current[.ImageMargin]!]
            let currentImageShape = self.Adjustment.current[.ImageShape]!
            
            let wordWidth = controller.TextBoxLabel.attributedText?.width(height: Size.TextBox.size - (controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant))
            if wordWidth == nil
            {
                return
            }
            let wordPart = wordWidth! + currentTextMargin * 2 <= Size.TextBox.size / 2.0 ? Size.TextBox.size / 2.0 : wordWidth! + currentTextMargin * 2
            let picPart = Size.TextBox.size - currentImageMargin
            let boxWidth = wordPart + picPart + 1
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                controller.TextBoxImageFilterView.alpha = Style.Adjustment.PreviewValue.ImageAlpha[Style.Adjustment.current[.ImageAlpha]!]
                if self.Adjustment.current[.ImagePositionLT] == 0
                {
                    controller.TextBoxImageViewLeading.constant = currentImageMargin
                    controller.TextBoxLabelTrailing.constant = currentTextMargin
                    controller.TextBoxImageViewTrailing.constant = wordPart
                    controller.TextBoxLabelLeading.constant = picPart + currentTextMargin
                }
                else if self.Adjustment.current[.ImagePositionLT] == 1
                {
                    controller.TextBoxImageViewTrailing.constant = currentImageMargin
                    controller.TextBoxLabelLeading.constant = currentTextMargin
                    controller.TextBoxImageViewLeading.constant = wordPart
                    controller.TextBoxLabelTrailing.constant = picPart + currentTextMargin
                }
                controller.TextBoxWidth.constant = boxWidth
                controller.TextBoxHeight.constant = Size.TextBox.size
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
            
            TextBox.UpdateToCenter(boxSize: CGSize(width: boxWidth, height: Size.TextBox.size), in: controller)
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
            
        case .Picture, .Postcard, .HorizontalPostcard:
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
        case .Picture, .Postcard, .HorizontalPostcard:
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.BackgroundEffectView.effect = UIBlurEffect(style: isDark ? .dark : .light)
                let currentFilter = self.Adjustment.PreviewValue.BGStyle[self.Adjustment.current[.BGStyle]!].filter
                switch currentFilter
                {
                case .pure:
                    currentFilterImage.image = controller.TextBoxImageView.image
                    currentFilterImage.filter = .picture
                    controller.TextBoxBackgroundImageView.alpha = 0
                case .picture:
                    currentFilterImage.image = controller.TextBoxImageView.image
                    currentFilterImage.filter = currentFilter
                    controller.TextBoxBackgroundImageView.image = controller.TextBoxImageView.image
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                case .blur:
                    if currentFilterImage.image != controller.TextBoxImageView.image || currentFilterImage.filter != currentFilter
                    {
                        currentFilterImage.image = controller.TextBoxImageView.image
                        currentFilterImage.filter = currentFilter
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getGaussianBlur(blurRadius: 30))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                case .pixellate:
                    if currentFilterImage.image != controller.TextBoxImageView.image || currentFilterImage.filter != currentFilter
                    {
                        currentFilterImage.image = controller.TextBoxImageView.image
                        currentFilterImage.filter = currentFilter
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getMosaic(value: 30))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                case .pointillize:
                    if currentFilterImage.image != controller.TextBoxImageView.image || currentFilterImage.filter != currentFilter
                    {
                        currentFilterImage.image = controller.TextBoxImageView.image
                        currentFilterImage.filter = currentFilter
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getPointillize(radius: 30))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                case .edge:
                    if currentFilterImage.image != controller.TextBoxImageView.image || currentFilterImage.filter != currentFilter
                    {
                        currentFilterImage.image = controller.TextBoxImageView.image
                        currentFilterImage.filter = currentFilter
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getEdge(intensity: 100))
                    }
                    controller.TextBoxBackgroundImageView.alpha = Style.Adjustment.PreviewValue.BGImageAlpha[Style.Adjustment.current[.BGImageAlpha]!]
                case .hexagon:
                    if currentFilterImage.image != controller.TextBoxImageView.image || currentFilterImage.filter != currentFilter
                    {
                        currentFilterImage.image = controller.TextBoxImageView.image
                        currentFilterImage.filter = currentFilter
                        controller.TextBoxBackgroundImageView.image = UIImage(cgImage: controller.TextBoxImageView.image!.getHexagon(scale: 30))
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
        case .Postcard, .HorizontalPostcard:
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
