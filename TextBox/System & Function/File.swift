//
//  File.swift
//  TextBox
//
//  Created by OX CL on 2019/8/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class File: NSObject {
    
    static func readFont(fileName: String)
    {
        let home = NSHomeDirectory() as NSString
        let docPath = home.appendingPathComponent("Documents") as NSString
        
        let filePath = docPath.appendingPathComponent(fileName)
        
        let font = 
    }

}
