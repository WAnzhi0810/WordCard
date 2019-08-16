//
//  Downloader.swift
//  TextBox
//
//  Created by OX CL on 2019/8/15.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit
import Foundation
import CoreGraphics
import CoreText

class Downloader {
    
    static var task = [URLSessionDataTask](repeating: URLSessionDataTask(), count: Font.FontName.allValues.count)
    static var loadingTag = [Bool](repeating: false, count: Font.FontName.allValues.count)
    static var progressTimer = [Timer](repeating: Timer(), count: Font.FontName.allValues.count)
    
    class func loadFont(tag: Int, in controller: ViewController)
    {
        Downloader.loadingTag[tag] = true
        let currentFontFile = Font.FontFileName[Font.FontName.allValues[tag]]!
        guard let url = URL(string: "http://47.103.64.94/textcard/fonts/" + currentFontFile) else {
            print("url open failed")
            return
        }
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: controller, delegateQueue: nil)
        var request = URLRequest(url: url)// NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalCacheData
        
        Downloader.task[tag] = session.dataTask(with: request) { (data: Data!, response: URLResponse!, error: Error!) -> Void in
            
            print("get in")
            if error == nil
            {
                //let statusCode = (response as! HTTPURLResponse).statusCode
                
                let fontData = data
                
                let dataProvider = CGDataProvider.init(data: fontData! as CFData)
                let cgFont = CGFont.init(dataProvider!)
                
                var loadError: Unmanaged<CFError>?
                
                if cgFont == nil
                {
                    OperationQueue.main.addOperation {
                        Downloader.loadingTag[tag] = false
                        KeyboardView.FontDataError(tag: tag, in: controller)
                        progressTimer[tag].invalidate()
                    }
                    print("font data error!")
                    return
                }
                
                if !CTFontManagerRegisterGraphicsFont(cgFont!, &loadError)
                {
                    OperationQueue.main.addOperation {
                        Downloader.loadingTag[tag] = false
                        KeyboardView.FontLoadFailed(tag: tag, in: controller)
                        progressTimer[tag].invalidate()
                    }
                    print("error loading font!")
                }
                else
                {
                    OperationQueue.main.addOperation {
                        Downloader.loadingTag[tag] = false
                        KeyboardView.FontLoaded(tag: tag, in: controller)
                        progressTimer[tag].invalidate()
                    }
                    
                    print("load success")
                }
            }
            else
            {
                OperationQueue.main.addOperation {
                    if Font.isExist(fontName: Font.FontName.allValues[tag])
                    {
                        return
                    }
                    Downloader.loadingTag[tag] = false
                    KeyboardView.FontLoadFailed(tag: tag, in: controller)
                    progressTimer[tag].invalidate()
                }
                print("load failed")
            }
        }
        
        Downloader.task[tag].resume()
        
        progressTimer[tag] = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
            let percent = Int(Float(Downloader.task[tag].countOfBytesReceived) / Float(Font.FontFileSize[Font.FontName.allValues[tag]]!) * 100.0)
            print("Downloading: \(Float(Downloader.task[tag].countOfBytesReceived) / Float(Font.FontFileSize[Font.FontName.allValues[tag]]!) * 100.0) %")
            
            KeyboardView.FontLoading(percent: percent, tag: tag, in: controller)
            
            //print("Current: \(Downloader.task.countOfBytesReceived)")
            //print("countOfBytesSent: \(Downloader.task.countOfBytesSent)")
            //print("ClientExpects: \(Downloader.task.countOfBytesClientExpectsToReceive)")
            //print("Expects: \(Downloader.task.countOfBytesExpectedToReceive)")
            /*print("totalUnitCount: \(Downloader.task.progress.totalUnitCount)")
            print("completedUnitCount: \(Downloader.task.progress.completedUnitCount)")
            print("fileCompletedCount: \(Downloader.task.progress.fileCompletedCount ?? 0)")
            print("fileTotalCount: \(Downloader.task.progress.fileTotalCount ?? 0)")
            print("expectedContentLength: \(Downloader.task.response?.expectedContentLength ?? 0)")*/
        }
        
        RunLoop.main.add(progressTimer[tag], forMode: RunLoop.Mode.common)
        
    }
    
    
}
