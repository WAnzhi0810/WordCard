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
    
    class Adjustment
    {
        enum type
        {
            case BGColor
            case FGColor
            case TextMargin
        }
        static let typeArray: [type] = [.BGColor, .FGColor, .TextMargin]
        
        static let displayType: [Style.Name : [Style.Adjustment.type]] =
                [.Blank : [.BGColor, .FGColor, .TextMargin],
                 .Picture : [.FGColor, .TextMargin]]
        
        static func displayTypeIndex(type: type, in name: Style.Name) -> Int?
        {
            return displayType[name]?.firstIndex(of: type)
        }
        
        static var current: [type : Int] = [.BGColor : 0,
                                            .FGColor : 0,
                                            .TextMargin : 3]
        
        static let PreviewValueDict: [type : [Any]] = [.BGColor : PreviewValue.BGColor,
                                                       .FGColor : PreviewValue.FGColor,
                                                       .TextMargin : PreviewValue.TextMargin]
        
        static let SectionTitle: [type : String] = [.BGColor : "背景颜色",
                                                    .FGColor : "文字颜色",
                                                    .TextMargin : "文字边距"]
        
        static let CellSize: [type : CGSize] = [.BGColor : CGSize(width: 40.0, height: 40.0),
                                                .FGColor : CGSize(width: 40.0, height: 40.0),
                                                .TextMargin : CGSize(width: 70.0, height: 50.0)]
        static let CellEdgeInset: [type : UIEdgeInsets] = [.BGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .FGColor : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                                                           .TextMargin : UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),]
        static let TableCellHeight: [type : CGFloat] = [.BGColor : 40.0 * 2 + 30,
                                                             .FGColor : 40.0 * 2 + 30,
                                                             .TextMargin : 50.0 * 2 + 30]
        
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
        }
        
        
        static func cellInit(cell: AdjustmentSingleSelectionCell, typeItem: Int, selectionItem: Int)
        {
            cell.layer.borderColor = Color.selected.cgColor
            
            let currentType = self.displayType[Style.current]![typeItem]
            cell.label.text = ""
            
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
                cell.backgroundColor = UIColor.white
                cell.layer.cornerRadius = 10.0
                cell.layer.borderWidth = selectionItem == self.current[.TextMargin]! ? 5.0 : 0.0
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
            }
            
            self.Update(in: controller)
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
            
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                
                controller.TextBox.backgroundColor = PreviewValue.BGColor[current[.BGColor]!]
                controller.TextBoxLabel.textColor = PreviewValue.FGColor[current[.FGColor]!]
                controller.TextBoxEditView.textColor = PreviewValue.FGColor[current[.FGColor]!]
                
                controller.TextBoxLabelTop.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelLeading.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelBottom.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                controller.TextBoxLabelTrailing.constant = PreviewValue.TextMargin[current[.TextMargin]!]
                Style.UpdateTextBox(in: controller)
                
                controller.view.layoutIfNeeded()
            }) { (true) in
                
            }
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    static func GeneratePreviewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxStyle", for: indexPath)
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    static func ChangeTo(item: Int, in controller: ViewController)
    {
        self.current = self.NameArray[item]
        self.UpdateTextBox(in: controller)
        
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
            let boxHeight = wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant <= Size.TextBox.Width ? Size.TextBox.Width : wordHeight! + controller.TextBoxLabelTop.constant + controller.TextBoxLabelBottom.constant + 1
            
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
