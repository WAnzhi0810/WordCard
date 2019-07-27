//
//  Color.swift
//  TextBox
//
//  Created by OX CL on 2019/7/21.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class Color {
    
    static let selected = UIColor.init(red: 0, green: 0.5, blue: 1, alpha: 1)
    
    static let MoveEmphasize = UIColor.lightGray
    
    class button {
        static let unSelectBG = UIColor.init(white: 160.0/255.0, alpha: 1)
        static let SelectBG = UIColor.black
        static let unSelectFG = UIColor.init(white: 100.0/255.0, alpha: 1)
        static let SelectFG = UIColor.white
    }
    
    class theme
    {
        static var current = UIColor.black
    }

}
