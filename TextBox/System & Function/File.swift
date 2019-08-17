//
//  File.swift
//  TextBox
//
//  Created by OX CL on 2019/8/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class File: NSObject {
    
    static func readFont(fileName: String) -> Bool
    {
        let home = NSHomeDirectory() as NSString
        let docPath = home.appendingPathComponent("Documents") as NSString
        
        let filePath = docPath.appendingPathComponent(fileName)
        
        guard let fontData = NSData(contentsOfFile: filePath) else
        {
            return false
        }
        
        let fontDataProvider = CGDataProvider(data: CFBridgingRetain(fontData) as! CFData)
        let cgFont = CGFont(fontDataProvider!)
        
        if cgFont == nil
        {
            return false
        }
        
        var fontError: Unmanaged<CFError>?
        
        if CTFontManagerRegisterGraphicsFont(cgFont!, &fontError)
        {
            return true
        }
        
        return false
    }
    
    static func writeFont(fileName: String, data: NSData) -> Bool
    {
        let home = NSHomeDirectory() as NSString
        let docPath = home.appendingPathComponent("Documents") as NSString
        
        let filePath = docPath.appendingPathComponent(fileName)
        
        if data.write(toFile: filePath, atomically: true)
        {
            return true
        }
        
        return false
    }
    
    static func deleteFont(fileName: String) -> Bool
    {
        let fileManager = FileManager.default
        
        let home = NSHomeDirectory() as NSString
        let docPath = home.appendingPathComponent("Documents") as NSString
        
        let filePath = docPath.appendingPathComponent(fileName)
        
        do
        {
            try fileManager.removeItem(atPath: filePath)
            return true
        }
        catch
        {
            print("delete failed")
            return false
        }
        
    }
    
    static func loadFont()
    {
        //let home = NSHomeDirectory() as NSString
        //let docPath = home.appendingPathComponent("Documents") as NSString
        
        for (_, oneFileName) in Font.FontFileName
        {
            print(self.readFont(fileName: oneFileName))
            //let filePath = docPath.appendingPathComponent(oneFileName)
            
        }
        
    }

}
