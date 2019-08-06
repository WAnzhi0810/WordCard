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
    static let NameArray: [Name] = [.Blank, .Picture]
    static var current = Name.Blank
    
    static var isDark = false
    
    static let BoxStyleImage =
    { () -> [UIImage] in
        if isDark
        {
            return [UIImage(named: "Style1_b")!,
                    UIImage(named: "Style2_b")!]
        }
        else
        {
            return [UIImage(named: "Style1_w")!,
                    UIImage(named: "Style2_w")!]
        }
    }
    
    class Adjustment
    {
        enum type
        {
            case BGColor
            case FGColor
            case BoxSize
            case TextMargin
            case ImageFilter
            case Image
            case ImageContentMode
        }
        
        static let typeArray: [type] = [.BoxSize, .BGColor, .FGColor, .TextMargin, .ImageFilter, .Image, .ImageContentMode]
        
        static let displayType: [Style.Name : [Style.Adjustment.type]] =
                [.Blank : [.BGColor, .FGColor, .BoxSize, .TextMargin],
                 .Picture : [.Image, .ImageFilter, .ImageContentMode, .BoxSize, .FGColor, .BGColor, .TextMargin]]
        
        static func displayTypeIndex(type: type, in name: Style.Name) -> Int?
        {
            return displayType[name]?.firstIndex(of: type)
        }
        
        static var current: [type : Int] = [.BGColor : 0,
                                            .FGColor : 0,
                                            .BoxSize : 1,
                                            .TextMargin : 2,
                                            .ImageFilter : 6,
                                            .Image : 1,
                                            .ImageContentMode : 2]
        
        static var customImage = UIImage(named: "ImagePlaceholder")
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .BoxSize : PreviewValue.BoxSize,
                                                       .TextMargin : PreviewValue.TextMargin,
                                                       .ImageFilter : PreviewValue.ImageFilter,
                                                       .Image : PreviewValue.Image,
                                                       .ImageContentMode : PreviewValue.ImageContentMode]
        
        static let SectionTitle: [type : String] = [.BGColor : "背景颜色".localize(),
                                                    .FGColor : "文字颜色".localize(),
                                                    .BoxSize : "卡片大小".localize(),
                                                    .TextMargin : "文字边距".localize(),
                                                    .ImageFilter : "背景图片亮度".localize(),
                                                    .Image : "当前图片".localize(),
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
                                                .BoxSize : CGSize(width: 80.0, height: 50.0),
                                                .TextMargin : CGSize(width: 70.0, height: 50.0),
                                                .ImageFilter : CGSize(width: 70.0, height: 50.0),
                                                .Image : CGSize(width: 100.0, height: 100.0),
                                                .ImageContentMode : CGSize(width: 80.0, height: 50.0)]
        static let CellEdgeInset: [type : UIEdgeInsets] = [.BGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .FGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .BoxSize : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageFilter : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .Image : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageContentMode : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)]
        static let TableCellHeight: [type : CGFloat] = [.BGColor : 40.0 * 2 + 30,
                                                        .FGColor : 40.0 * 2 + 30,
                                                        .BoxSize : 50.0 + 20,
                                                        .TextMargin : 50.0 * 2 + 30,
                                                        .ImageFilter : 50.0 + 20,
                                                        .Image : 100.0 + 20,
                                                        .ImageContentMode : 50.0 * 3 + 40]
        
        class PreviewValue
        {
            static let maxNum = 30
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
                                  UIColor.white]
            static let BoxSize: [CGFloat] = [400, 600, 1200]
            static let TextMargin: [CGFloat] = [10, 20, 40, 60, 80, 100, 120, 140, 160]
            static let ImageFilter: [Int] = [-6, -4, -2, 0, 2, 4, 6]
            static let Image: [UIImage] = [UIImage(named: "Image_add")!,
                                           UIImage(named: "image1")!,
                                           UIImage(named: "image2")!]
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
            case type.BoxSize:
                self.current[.BoxSize] = selectionItem
            case type.TextMargin:
                self.current[.TextMargin] = selectionItem
            case type.ImageFilter:
                self.current[.ImageFilter] = selectionItem
            case type.Image:
                self.current[.Image] = selectionItem
                if selectionItem == 0
                {
                    controller.present(controller.photoPickerViewController, animated: true, completion: nil)
                }
            case type.ImageContentMode:
                self.current[.ImageContentMode] = selectionItem
            }
            
            self.Update(in: controller)
            Style.UpdateBackgroundAndDark(in: controller)
        }
        
        static func UpdateDarkCell(in controller: ViewController)
        {
            
            let darkableType: [Style.Adjustment.type] = [.BoxSize, .TextMargin, .ImageFilter, .ImageContentMode]
            
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
            case .Blank:
                Size.TextBox.scaleRatio = Size.TextBox.displayWidth / Size.TextBox.size
            case .Picture:
                Size.TextBox.scaleRatio = Size.TextBox.displayWidth / Size.TextBox.size
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    controller.TextBoxImageFilterView.backgroundColor = UIColor(white: PreviewValue.ImageFilter[current[.ImageFilter]!] >= 0 ? 1 : 0, alpha: CGFloat(abs(PreviewValue.ImageFilter[current[.ImageFilter]!])) / 10.0)
                    controller.TextBoxImageView.image = current[.Image] == 0 ? customImage ?? UIImage(named: "ImagePlaceholder") : PreviewValue.Image[current[.Image]!]
                    controller.TextBoxImageView.contentMode = PreviewValue.ImageContentMode[current[.ImageContentMode]!]
                    
                    controller.view.layoutIfNeeded()
                }) { (true) in
                    
                }
            }
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                
                controller.TextBoxShadowView.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBoxContent.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBoxLabel.textColor = PreviewValue.FGColor[current[.FGColor]!]
                controller.TextBoxEditView.textColor = PreviewValue.FGColor[current[.FGColor]!]
                
                controller.TextBoxLabelTop.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelLeading.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelBottom.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelTrailing.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxEditViewTop.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxEditViewLeading.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxEditViewBottom.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxEditViewTrailing.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                
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
        self.UpdateTextBox(in: controller)
        self.UpdateBackgroundAndDark(in: controller)
    }
    
    static func UpdateStyle(in controller: ViewController)
    {
        switch self.current
        {
        case Name.Blank:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 0
                controller.BackgroundImageView.alpha = 0
                controller.BackgroundEffectView.effect = nil
                controller.TextBoxImageFilterView.alpha = 0
            }, completion: nil)
            
        case Name.Picture:
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxImageView.alpha = 1
                controller.BackgroundImageView.alpha = 1
                controller.TextBoxImageFilterView.alpha = 1
            }, completion: nil)
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
            let boxHeight = wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant <= Size.TextBox.size ? Size.TextBox.size : wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant + 1
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxHeight.constant = boxHeight
                controller.TextBoxWidth.constant = Size.TextBox.size
                controller.view.layoutIfNeeded()
            }, completion: nil)
            
            if self.current == .Picture
            {
                controller.TextBoxImageView.frame = CGRect(x: -1, y: -1, width: Size.TextBox.size+2, height: boxHeight+2)
                controller.TextBoxImageFilterView.frame = CGRect(x: -1, y: -1, width: Size.TextBox.size+2, height: boxHeight+2)
            }
            
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
                if bgc == 0
                {
                    if fgc == 0 || fgc == 25
                    {
                        controller.BackgroundView.backgroundColor = Color.AppColor
                    }
                    else
                    {
                        controller.BackgroundView.backgroundColor = Style.Adjustment.PreviewValue.BackgroundViewColor[fgc>=13 ? fgc-12 : fgc]
                    }
                }
                else if bgc == 25
                {
                    if fgc == 0 || fgc == 25
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
            
            self.UpdateDark(isDark: bgc<13 ? false : true, in: controller)
            
        case .Picture:
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
        case .Picture:
            UIView.linear(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.BackgroundEffectView.effect = UIBlurEffect(style: isDark ? .dark : .light)
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
    

}

extension Style.Name: EnumeratableEnumType
{
    static var allValues: [Style.Name]
    {
        return [.Blank, .Picture]
    }
}
