//
//  AdjustmentSelectionTypeCell.swift
//  TextBox
//
//  Created by OX CL on 2019/7/23.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class AdjustmentSelectionTypeCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: - UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Style.Adjustment.PreviewValueDict[Style.Adjustment.typeArray[self.tag]]!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdjustmentSingleSelection", for: indexPath)
        cell.tag = indexPath.item
        Style.Adjustment.cellInit(cell: cell, typeItem: self.tag, selectionItem: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Style.Adjustment.CellSize[Style.Adjustment.typeArray[self.tag]]!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Size.PopView.CollectionViewGap, left: Size.PopView.CollectionViewGap, bottom: Size.PopView.CollectionViewGap, right: Size.PopView.CollectionViewGap)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controllerOption = collectionView.getCurrentVC()
        if controllerOption == nil
        {
            return
        }
        let controller = controllerOption! as! ViewController
        
        
        Style.Adjustment.cellOperation(typeItem: self.tag, selectionItem: indexPath.item, in: controller)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

}
