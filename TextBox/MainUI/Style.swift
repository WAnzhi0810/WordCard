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
            case TextMargin
            case ImageFilter
            case Image
        }
        static let typeArray: [type] = [.BGColor, .FGColor, .TextMargin, .ImageFilter, .Image]
        
        static let displayType: [Style.Name : [Style.Adjustment.type]] =
                [.Blank : [.BGColor, .FGColor, .TextMargin],
                 .Picture : [.Image, .ImageFilter, .FGColor, .TextMargin]]
        
        static func displayTypeIndex(type: type, in name: Style.Name) -> Int?
        {
            return displayType[name]?.firstIndex(of: type)
        }
        
        static var current: [type : Int] = [.BGColor : 0,
                                            .FGColor : 0,
                                            .TextMargin : 3,
                                            .ImageFilter : 6,
                                            .Image : 0]
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .TextMargin : PreviewValue.TextMargin,
                                                       .ImageFilter : PreviewValue.ImageFilter,
                                                       .Image : PreviewValue.Image]
        
        static let SectionTitle: [type : String] = [.BGColor : "背景颜色".localize(),
                                                    .FGColor : "文字颜色".localize(),
                                                    .TextMargin : "文字边距".localize(),
                                                    .ImageFilter : "背景图片亮度".localize(),
                                                    .Image : "当前图片".localize()]
        
        static let CellSize: [type : CGSize] = [.BGColor : CGSize(width: 40.0, height: 40.0),
                                                .FGColor : CGSize(width: 40.0, height: 40.0),
                                                .TextMargin : CGSize(width: 70.0, height: 50.0),
                                                .ImageFilter : CGSize(width: 70.0, height: 50.0),
                                                .Image : CGSize(width: 100.0, height: 100.0)]
        static let CellEdgeInset: [type : UIEdgeInsets] = [.BGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .FGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .ImageFilter : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .Image : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),]
        static let TableCellHeight: [type : CGFloat] = [.BGColor : 40.0 * 2 + 30,
                                                        .FGColor : 40.0 * 2 + 30,
                                                        .TextMargin : 50.0 * 2 + 30,
                                                        .ImageFilter : 50.0 + 20,
                                                        .Image : 100.0 + 20]
        
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
            static let TextMargin: [CGFloat] = [5, 10, 15, 20, 25, 30, 35, 40, 50]
            static let ImageFilter: [Int] = [-6, -4, -2, 0, 2, 4, 6]
            static let Image: [UIImage] = [UIImage(named: "image1")!,
                                           UIImage(named: "image2")!]
            
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
            cell.image.image = nil
            
            switch currentType
            {
            case type.BGColor:
                cell.backgroundColor = PreviewValue.BGColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                cell.layer.borderWidth = selectionItem == self.current[.BGColor]! ? 5.0 : 0.0
                //cell.layer.cornerRadius = CellSize[.BGColor]!.height / 2.0
            case type.FGColor:
                cell.backgroundColor = PreviewValue.FGColor[selectionItem]
                cell.layer.cornerRadius = 20.0
                cell.layer.borderWidth = selectionItem == self.current[.FGColor]! ? 5.0 : 0.0
                //cell.layer.cornerRadius = CellSize[.FGColor]!.height / 2.0
            case type.TextMargin:
                cell.label.text = String(Int(PreviewValue.TextMargin[selectionItem]))
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.TextMargin]! ? 5.0 : 0.0
            case type.ImageFilter:
                cell.label.text = String(PreviewValue.ImageFilter[selectionItem])
                cell.label.textColor = Style.isDark ? UIColor.white : UIColor.black
                cell.backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.ImageFilter]! ? 5.0 : 0.0
            case type.Image:
                cell.image.image = PreviewValue.Image[selectionItem]
                cell.layer.cornerRadius = 20.0
                cell.layer.borderWidth = selectionItem == self.current[.Image]! ? 5.0 : 0.0
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
            case type.TextMargin:
                self.current[.TextMargin] = selectionItem
            case type.ImageFilter:
                self.current[.ImageFilter] = selectionItem
            case type.Image:
                self.current[.Image] = selectionItem
            }
            
            self.Update(in: controller)
            Style.UpdateBackgroundAndDark(in: controller)
        }
        
        static func UpdateDarkCell()
        {
            let currentStyleTextMarginIndex = self.displayTypeIndex(type: Style.Adjustment.type.TextMargin, in: Style.current)
            let currentStyleImageFilterIndex = self.displayTypeIndex(type: Style.Adjustment.type.ImageFilter, in: Style.current)
            
            if currentStyleTextMarginIndex != nil
            {
                for oneSelectionItem in 0...self.PreviewValueDict[.TextMargin]!.count - 1
                {
                    // 防止此 CollectionViewCell 因未查看整个 CollectionView 使其 Cell 全部加载而导致的无法找到该未加载的 CollectionViewCell 引起的程序崩溃
                    if !AdjustmentCell.isLoaded[currentStyleTextMarginIndex!][oneSelectionItem]
                    {
                        continue
                    }
                    AdjustmentCell.CollectionCell[currentStyleTextMarginIndex!][oneSelectionItem].label.textColor = Style.isDark ? UIColor.white : UIColor.black
                    AdjustmentCell.CollectionCell[currentStyleTextMarginIndex!][oneSelectionItem].backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                    /*if !AdjustmentCell.isLoaded[currentStyleTextMarginIndex!][oneSelectionItem]
                    {
                        continue
                    }
                    self.cellInit(cell: AdjustmentCell.CollectionCell[currentStyleTextMarginIndex!][oneSelectionItem], typeItem: currentStyleTextMarginIndex!, selectionItem: oneSelectionItem)*/
                }
            }
            if currentStyleImageFilterIndex != nil
            {
                for oneSelectionItem in 0...self.PreviewValueDict[.ImageFilter]!.count - 1
                {
                    // 防止此 CollectionViewCell 因未查看整个 CollectionView 使其 Cell 全部加载而导致的无法找到该未加载的 CollectionViewCell 引起的程序崩溃
                    if !AdjustmentCell.isLoaded[currentStyleImageFilterIndex!][oneSelectionItem]
                    {
                        continue
                    }
                    AdjustmentCell.CollectionCell[currentStyleImageFilterIndex!][oneSelectionItem].label.textColor = Style.isDark ? UIColor.white : UIColor.black
                    AdjustmentCell.CollectionCell[currentStyleImageFilterIndex!][oneSelectionItem].backgroundColor = Style.isDark ? UIColor.black : UIColor.white
                    /*if !AdjustmentCell.isLoaded[currentStyleImageFilterIndex!][oneSelectionItem]
                    {
                        continue
                    }
                    self.cellInit(cell: AdjustmentCell.CollectionCell[currentStyleImageFilterIndex!][oneSelectionItem], typeItem: currentStyleImageFilterIndex!, selectionItem: oneSelectionItem)*/
                }
            }
            
        }
        
        static func Update(in controller: ViewController)
        {
            for currentType in displayType[Style.current]!
            {
                //print("currentType: \(currentType)")
                
                /*let tableCellOption = controller.PopViewAdjustmentTableView.cellForRow(at: IndexPath(row: 0, section: currentType.rawValue)) as? AdjustmentSelectionTypeCell
                if tableCellOption == nil
                {
                    continue
                }
                let tableCell = tableCellOption!*/
                
                for item in 0...PreviewValueDict[currentType]!.count-1
                {
                    //print("item: \(item)")
                    
                    //_ = tableCell.SingleSelectionCollectionView.dataSource?.collectionView(tableCell.SingleSelectionCollectionView, cellForItemAt: IndexPath(item: item, section: 0))
                    let cell = AdjustmentCell.CollectionCell[displayTypeIndex(type: currentType, in: Style.current)!][item]
                    /*let cell = tableCell.SingleSelectionCollectionView.cellForItem(at: IndexPath(item: item, section: 0))
                    if cell == nil
                    {
                        continue
                    }*/
                    cell.layer.borderWidth = 0.0
                }
                
                //_ = tableCell.SingleSelectionCollectionView.dataSource?.collectionView(tableCell.SingleSelectionCollectionView, cellForItemAt: IndexPath(item: self.current[currentType]!, section: 0))
                let cell = AdjustmentCell.CollectionCell[displayTypeIndex(type: currentType, in: Style.current)!][self.current[currentType]!]
                /*let cell = tableCell.SingleSelectionCollectionView.cellForItem(at: IndexPath(item: self.current[currentType]!, section: 0))
                if cell == nil
                {
                    continue
                }*/
                cell.layer.borderWidth = 5.0
                //tableCell.SingleSelectionCollectionView.cellForItem(at: IndexPath(item: self.current[currentType]!, section: 0))!.layer.borderWidth = 5.0
            }
            
            // Operation
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                
                controller.TextBoxShadowView.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBox.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
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
                
                controller.TextBoxImageFilterView.backgroundColor = UIColor(white: PreviewValue.ImageFilter[current[.ImageFilter]!] >= 0 ? 1 : 0, alpha: CGFloat(abs(PreviewValue.ImageFilter[current[.ImageFilter]!])) / 10.0)
                controller.TextBoxImageView.image = PreviewValue.Image[current[.Image]!]
                
                Style.UpdateTextBox(in: controller)
                
                controller.view.layoutIfNeeded()
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
        
        ModelCell.CollectionCell[indexPath.item] = cell
        
        return cell
    }
    static func ChangeTo(item: Int, in controller: ViewController)
    {
        self.current = self.NameArray[item]
        
        for (n, cell) in ModelCell.CollectionCell.enumerated()
        {
            cell.layer.borderWidth = n == item ? 5.0 : 0.0
        }
        
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
            let boxHeight = wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant <= Size.TextBox.Width ? Size.TextBox.Width : wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant + 1
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxHeight.constant = boxHeight
                controller.TextBoxWidth.constant = Size.TextBox.Width
                controller.view.layoutIfNeeded()
            }, completion: nil)
            
            if self.current == .Picture
            {
                controller.TextBoxImageView.frame = CGRect(x: -1, y: -1, width: Size.TextBox.Width+2, height: boxHeight+2)
                controller.TextBoxImageFilterView.frame = CGRect(x: -1, y: -1, width: Size.TextBox.Width+2, height: boxHeight+2)
            }
            
            TextBox.UpdateTopToCenter(boxSize: CGSize(width: Size.TextBox.Width, height: boxHeight), in: controller)
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
        self.Adjustment.UpdateDarkCell()
        EditAccessoryView.UpdateDark()
    }
    

}

extension Style.Name: EnumeratableEnumType
{
    static var allValues: [Style.Name]
    {
        return [.Blank, .Picture]
    }
}
