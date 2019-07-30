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
    
    static func UpdateTopToCenter(boxSize: CGSize, in controller: ViewController)
    {
        if boxSize.height > controller.TextBoxScrollView.bounds.height - 30.0 * 2
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxTop.constant = 30.0
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
    }
    
    func UpdateTopToCenter(in controller: ViewController)
    {
        if self.bounds.height > controller.TextBoxScrollView.bounds.height - 30.0 * 2
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxTop.constant = 30.0
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.easeOut(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
                controller.TextBoxTop.constant = (controller.TextBoxScrollView.bounds.height - self.bounds.height) / 2.0
                controller.view.layoutIfNeeded()
            }, completion: nil)
        }
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
