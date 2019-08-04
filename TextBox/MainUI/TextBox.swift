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
    
    func StyleInit(in controller: ViewController)
    {
        Style.UpdateStyle(in: controller)
        Style.UpdateTextBox(in: controller)
        Style.Adjustment.Update(in: controller)
        Style.UpdateBackgroundAndDark(in: controller)
    }
    
    func StyleUpdate(in controller: ViewController)
    {
        Style.Adjustment.Update(in: controller)
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
        UIGraphicsBeginImageContext(CGSize(width: view.bounds.width * Size.TextBox.scaleRatio, height: view.bounds.height * Size.TextBox.scaleRatio))
        do
        {
            let savedFrame = view.frame
            view.frame = CGRect(origin: .zero, size: view.bounds.size)
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: view.bounds.width * Size.TextBox.scaleRatio, height: view.bounds.height * Size.TextBox.scaleRatio), false, 0)
            
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
    
    // MARK: Move back
    func MoveTo0(in controller: ViewController)
    {
        self.moveBottom(to: 20, in: controller)
    }
    
    // MARK: - PopView poped position
    func MoveForPop(in controller: ViewController)
    {
        self.moveBottom(to: Size.PopView.Height - Size.BottomHeight - 50.0, in: controller)
    }
    
    func adaptiveScaling()
    {
        //self.layer.anchorPoint = CGPoint(x: 1, y: 1)
        self.transform = CGAffineTransform(scaleX: Size.TextBox.scaleRatio, y: Size.TextBox.scaleRatio)
    }
    
    /*func TopInit(in controller: ViewController) // fix bug for position movement of TextBox at the beginning of the opening
    {
        UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            controller.TextBoxTop.constant = (Size.TextBoxScrollView.HeightInit - self.bounds.height) / 2.0
            print((Size.TextBoxScrollView.HeightInit - self.bounds.height) / 2.0)
            print("boxHeight: \(self.bounds.height)")
            print("ScrollViewHeight: \(Size.TextBoxScrollView.HeightInit)")
            controller.view.layoutIfNeeded()
        }, completion: nil)
    }*/
    
    static func UpdateToCenter(boxSize: CGSize, in controller: ViewController)
    {
        if boxSize.height * Size.TextBox.scaleRatio > controller.TextBoxScrollView.bounds.height - 30.0 * 2
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxTop.constant = -100
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxTop.constant = (controller.TextBoxScrollView.bounds.height - boxSize.height) / 2.0
                print((controller.TextBoxScrollView.bounds.height - boxSize.height) / 2.0)
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        if boxSize.width * Size.TextBox.scaleRatio > controller.TextBoxScrollView.bounds.width - 30.0 * 2
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxLeading.constant = 30.0
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxLeading.constant = (controller.TextBoxScrollView.bounds.width - boxSize.width) / 2.0
                print((controller.TextBoxScrollView.bounds.width - boxSize.width) / 2.0)
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        
        controller.TextBoxScrollView.contentSize = CGSize(width: boxSize.width * Size.TextBox.scaleRatio + 30.0 * 2, height: boxSize.height * Size.TextBox.scaleRatio + 30.0 * 2)
    }
    
    func UpdateToCenter(in controller: ViewController)
    {
        TextBox.UpdateToCenter(boxSize: self.bounds.size, in: controller)
    }
    
    
    func TurnToEditMode(isOn: Bool,in controller: ViewController)
    {
        controller.TextBoxEditView.inputView = nil
        EditAccessoryView.AllButtonUnselected()
        controller.TextBoxEditView.isHidden = !isOn
        controller.TextBoxLabel.isHidden = isOn
        
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
            Style.UpdateTextBox(in: controller)
        }
    }

}
