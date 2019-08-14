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
    
    static let AppColor = UIColor.init(hue: 305.0/360.0, saturation: 0.1, brightness: 0.9, alpha: 1)
    static let AppColorDark = UIColor.init(hue: 305.0/360.0, saturation: 0.2, brightness: 0.4, alpha: 1)
    
    class button {
        class white
        {
            static let unSelectBG = UIColor.init(white: 160.0/255.0, alpha: 1)
            static let SelectBG = UIColor.black
            static let unSelectFG = UIColor.init(white: 100.0/255.0, alpha: 1)
            static let SelectFG = UIColor.white
        }
        class black
        {
            static let unSelectBG = UIColor.black
            static let SelectBG = UIColor.white
            static let unSelectFG = UIColor.init(white: 160.0/255.0, alpha: 1)
            static let SelectFG = UIColor.black
        }
    }
    
    class theme
    {
        static var current = UIColor.black
    }
    
    static let Background = [UIColor.white,
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
    
    
    static let Foreground = [UIColor.black,
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
    
    static let BackgroundView = [UIColor.white,
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
