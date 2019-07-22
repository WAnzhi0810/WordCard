//
//  TextBox.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class TextBox: UIView {
    
    func SizeInit(in controller: ViewController)
    {
        controller.TextBoxWidth.constant = Size.TextBox.Width
        controller.TextBoxHeight.constant = Size.TextBox.Width
    }
    
    func InputAccessoryInit(in controller: ViewController)
    {
        controller.TextBoxEditView.inputAccessoryView = EditAccessoryView.GenerateView(in: controller)
    }
    
    
    // MARK: - Export
    func Export(in controller: ViewController)
    {
        let contentImage = captureInView(view: self)
        if contentImage == nil
        {
            return
        }
        let activityVC = UIActivityViewController(activityItems: [contentImage as Any], applicationActivities: nil)
        controller.present(activityVC, animated: true, completion: nil)
        
        //UIImageWriteToSavedPhotosAlbum(contentImage!, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject)
    {
        if error != nil
        {
            print("saved error!")
            return
        }
    }
    
    func captureInView(view: UIView) -> UIImage?
    {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(view.bounds.size)
        do
        {
            let savedFrame = view.frame
            view.frame = CGRect(origin: .zero, size: view.bounds.size)
            
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
            
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            image = UIGraphicsGetImageFromCurrentImageContext()
            
            view.frame = savedFrame
        }
        UIGraphicsEndImageContext()
        if image != nil
        {
            return image!
        }
        return nil
    }
    
    
    // MARK: - Move

    func moveBottom(to bottom: CGFloat, in controller: ViewController)
    {
        
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            controller.TextBoxBottom.constant = bottom
            controller.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func moveToCenter(mySize size: CGSize)
    {
        self.frame = CGRect(x: Size.ScreenWidth/2.0 - size.width/2.0, y: Size.ScreenHeight/2.0 - size.height/2.0, width: size.width, height: size.height )
    }
    
    // MARK: Move back
    func MoveTo0(in controller: ViewController)
    {
        self.moveBottom(to: 20, in: controller)
    }
    
    // MARK: - PopView poped position
    func MoveForPop(in controller: ViewController)
    {
        self.moveBottom(to: Size.PopView.Height - 70.0, in: controller)
    }
    
    func UpdateTopToCenter(in controller: ViewController)
    {
        UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            controller.TextBoxTop.constant = (controller.TextBoxScrollView.bounds.height - Size.TextBox.Width) / 2.0
            controller.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    
    
    func TurnToEditMode(isOn: Bool,in controller: ViewController)
    {
        controller.TextBoxEditView.isHidden = !isOn
        controller.TextBoxEditBGView.isHidden = !isOn
        
        if isOn
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                
                controller.TextBoxHeight.constant = Size.TextBox.Width
                controller.TextBoxWidth.constant = Size.TextBox.Width
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            let wordHeight = controller.TextBoxLabel.attributedText?.height(width: controller.TextBoxLabel.bounds.width)
            if wordHeight == nil
            {
                return
            }
            let boxHeight = wordHeight! + 20.0 * 2
            
            if boxHeight <= Size.TextBox.Width
            {
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    controller.TextBoxTop.constant = (controller.TextBoxScrollView.bounds.height - Size.TextBox.Width) / 2.0
                    controller.TextBoxHeight.constant = Size.TextBox.Width
                    controller.TextBoxWidth.constant = Size.TextBox.Width
                    //controller.TextBoxWidth.isActive = true
                    //controller.TextBoxHeight.isActive = true
                    controller.view.layoutIfNeeded()
                }, completion: nil)
            }
            else if boxHeight > controller.TextBoxScrollView.bounds.height - 20.0 * 2
            {
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    controller.TextBoxTop.constant = 20.0
                    controller.TextBoxHeight.constant = boxHeight
                    controller.TextBoxWidth.constant = Size.TextBox.Width
                    //controller.TextBoxWidth.isActive = true
                    //controller.TextBoxHeight.isActive = true
                    controller.view.layoutIfNeeded()
                }, completion: nil)
            }
            else
            {
                UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                    controller.TextBoxTop.constant = (controller.TextBoxScrollView.bounds.height - boxHeight) / 2.0
                    controller.TextBoxHeight.constant = boxHeight
                    controller.TextBoxWidth.constant = Size.TextBox.Width
                    //controller.TextBoxWidth.isActive = true
                    //controller.TextBoxHeight.isActive = true
                    controller.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }

}
