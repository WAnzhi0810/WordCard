//
//  ViewController.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    

    @IBOutlet weak var DarkenView: UIView!
    
    @IBOutlet weak var TextBoxScrollView: UIScrollView!
    
    @IBOutlet weak var TextBoxShadowView: UIView!
    @IBOutlet weak var TextBox: TextBox!
    @IBOutlet weak var TextBoxWidth: NSLayoutConstraint!
    @IBOutlet weak var TextBoxHeight: NSLayoutConstraint!
    @IBOutlet weak var TextBoxBottom: NSLayoutConstraint!
    @IBOutlet weak var TextBoxTop: NSLayoutConstraint!
    
    @IBOutlet weak var TextBoxLabel: UILabel!
    @IBOutlet weak var TextBoxEditBGView: UIView!
    @IBOutlet weak var TextBoxEditView: EditView!
    
    
    @IBOutlet weak var PopView: PopView!
    @IBOutlet weak var PopViewBottom: NSLayoutConstraint!
    
    
    
    // MARK: - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        self.TextBox.SizeInit(in: self)
        self.TextBox.InputAccessoryInit(in: self)
        
        self.TextBoxEditView.FontInit()
    }
    
    @objc func keyboardChanged(_ notification: Notification)
    {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        let keyboardHeight = keyboardViewEndFrame.height
        
        
        if notification.name == UIResponder.keyboardWillShowNotification
        {
            self.TextBox.moveBottom(to: keyboardHeight - 70.0, in: self)
            Size.KeyboardHeight = keyboardHeight
        }
        else
        {
            self.TextBox.MoveTo0(in: self)
        }
        self.TextBox.UpdateTopToCenter(in: self)
        
    }

    
    // MARK: - Button Operation
    
    @IBAction func ButtonTouchDown(_ sender: UIButton) {
        UIView.easeOut(duration: Constant.AnimationInterval.Fast, delay: 0, doing: {
            sender.alpha = 0.3
        }, completion: nil)
    }
    
    @IBAction func ButtonTouchUp(_ sender: UIButton) {
        UIView.linear(duration: Constant.AnimationInterval.Fast, delay: 0, doing: {
            sender.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func ModelButtonUpInside(_ sender: UIButton) {
        self.PopView.popUp(with: .Model,  in: self)
        self.TextBox.MoveForPop(in: self)
    }
    
    @IBAction func AdjustmentButtonUpInside(_ sender: UIButton) {
        self.PopView.popUp(with: .Adjustment, in: self)
        self.TextBox.MoveForPop(in: self)
    }
    
    @IBAction func ExportButtonUpInside(_ sender: UIButton) {
        self.TextBox.Export(in: self)
    }
    
    @IBAction func PopViewCancelButtonUpInside(_ sender: UIButton) {
        PopViewMoveDownOperation()
    }
    
    // MARK: - TextBox & TextBoxView
    
    @IBAction func TextBoxViewTapped(_ sender: UITapGestureRecognizer) {
        PopViewMoveDownOperation()
    }
    
    func PopViewMoveDownOperation()
    {
        self.TextBoxTurnToEdit(toEdit: false)
        self.PopView.popDown(in: self)
        self.TextBox.MoveTo0(in: self)
    }
    
    
    @IBAction func TextBoxTapped(_ sender: UITapGestureRecognizer) {
        self.TextBoxTurnToEdit(toEdit: true)
    }
    
    // TextBoxView change selection
    func textViewDidChangeSelection(_ textView: UITextView) {
        self.TextBoxEditView.GetAndSetCurrentAlignment()
    }
    
    
    // MARK: - Edit Accessory View
    
    @objc func KeyboardButton(_ sender: UIButton)
    {
        switch sender.tag
        {
        case EditAccessoryView.buttonID.Font.rawValue, EditAccessoryView.buttonID.Fontsize.rawValue://Font & Font size
            sender.isSelected ? KeyboardViewOperation(tag: 0) : KeyboardViewOperation(tag: sender.tag)
        case EditAccessoryView.buttonID.LeftAlign.rawValue://Left align
            self.TextBoxEditView.setAlignment(textAlignment: NSTextAlignment.left)
        case EditAccessoryView.buttonID.CenterAlign.rawValue://Center align
            self.TextBoxEditView.setAlignment(textAlignment: NSTextAlignment.center)
        case EditAccessoryView.buttonID.RightAlign.rawValue://Right align
            self.TextBoxEditView.setAlignment(textAlignment: NSTextAlignment.right)
        default:
            break
        }
        EditAccessoryView.ButtonSelectOperation(sender: sender)
    }
    
    func TextBoxTurnToEdit(toEdit: Bool)
    {
        if toEdit
        {
            self.PopView.popDown(in: self)
            self.TextBox.TurnToEditMode(isOn: true, in: self)
            self.TextBoxEditView.becomeFirstResponder()
        }
        else
        {
            self.TextBoxEditView.resignFirstResponder()
            self.TextBoxLabel.attributedText = self.TextBoxEditView.attributedText
            self.TextBox.TurnToEditMode(isOn: false, in: self)
        }
    }
    
    @objc func KeyboardComplishButton()
    {
        self.TextBoxTurnToEdit(toEdit: false)
    }
    
    // FontView Button UpInside
    @objc func KeyboardFontViewButton(_ sender: UIButton)
    {
        KeyboardView.FontOperation(tag: sender.tag, in: self)
    }
    
    // FontSizeView Button UpInside
    @objc func KeyboardFontSizeViewButton(_ sender: UIButton)
    {
        KeyboardView.FontSizeOperation(tag: sender.tag, in: self)
    }
    
    func KeyboardViewOperation(tag: Int)
    {
        if tag != 0 // Open
        {
            self.TextBoxEditView.resignFirstResponder()
            self.TextBoxEditView.inputView = KeyboardView.GenerateView(in: self, tag: tag)
            self.TextBoxEditView.becomeFirstResponder()
        }
        else // Close
        {
            self.TextBoxEditView.resignFirstResponder()
            self.TextBoxEditView.inputView = nil
            self.TextBoxEditView.becomeFirstResponder()
        }
    }
    
    @objc func KeyboardViewClose()
    {
        self.KeyboardViewOperation(tag: 0)
        EditAccessoryView.FontButtonSelectionClear()
    }
    
    
    // MARK: - StatusBar
    var isStatusBarBlack = true
    
    func ChangeStatusBarStyle(isChangeToBlack: Bool, duration: TimeInterval)
    {
        self.isStatusBarBlack = isChangeToBlack
        UIView.animate(withDuration: duration) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        if self.isStatusBarBlack
        {
            return .default
        }
        else
        {
            return .lightContent
        }
    }
    
}

