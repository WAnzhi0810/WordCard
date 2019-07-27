//
//  AdjustmentSingleSelectionCell.swift
//  TextBox
//
//  Created by OX CL on 2019/7/27.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class AdjustmentSingleSelectionCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
}
