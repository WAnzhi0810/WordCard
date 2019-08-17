//
//  ViewController.swift
//  TextBox
//
//  Created by OX CL on 2019/7/16.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate , UINavigationControllerDelegate, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
    
    var isFirstAppear = true
    
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var BackgroundImageView: UIImageView!
    @IBOutlet weak var BackgroundEffectView: UIVisualEffectView!
    
    
    @IBOutlet weak var TextBoxScrollView: UIScrollView!
    
    @IBOutlet weak var TextBox: TextBox!
    @IBOutlet weak var TextBoxShadowView: UIView!
    @IBOutlet weak var TextBoxContent: UIView!
    @IBOutlet weak var TextBoxWidth: NSLayoutConstraint!
    @IBOutlet weak var TextBoxHeight: NSLayoutConstraint!
    
    @IBOutlet weak var TextBoxTop: NSLayoutConstraint!
    @IBOutlet weak var TextBoxLeading: NSLayoutConstraint!
    
    @IBOutlet weak var TextBoxLabelTrailing: NSLayoutConstraint!
    @IBOutlet weak var TextBoxLabelTop: NSLayoutConstraint!
    @IBOutlet weak var TextBoxLabelLeading: NSLayoutConstraint!
    @IBOutlet weak var TextBoxLabelBottom: NSLayoutConstraint!
    @IBOutlet weak var TextBoxEditViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var TextBoxEditViewTop: NSLayoutConstraint!
    @IBOutlet weak var TextBoxEditViewLeading: NSLayoutConstraint!
    @IBOutlet weak var TextBoxEditViewBottom: NSLayoutConstraint!
    @IBOutlet weak var TextBoxImageViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var TextBoxImageViewTop: NSLayoutConstraint!
    @IBOutlet weak var TextBoxImageViewLeading: NSLayoutConstraint!
    @IBOutlet weak var TextBoxImageViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var TextBoxBackgroundImageView: UIImageView!
    @IBOutlet weak var TextBoxImageView: UIImageView!
    @IBOutlet weak var TextBoxImageFilterView: UIView!
    @IBOutlet weak var TextBoxDecorationView: UIView!
    @IBOutlet weak var TextBoxLabel: UILabel!
    @IBOutlet weak var TextBoxEditView: EditView!
    
    @IBOutlet weak var PopView: PopView!
    @IBOutlet weak var PopBackgroundView: UIView!
    
    
    @IBOutlet weak var PopViewAdjustmentTableView: UITableView!
    @IBOutlet weak var PopViewModelCollectionView: UICollectionView!
    
    @IBOutlet weak var AdjustmentButton: UIButton!
    @IBOutlet weak var ModelButton: UIButton!
    @IBOutlet weak var ShareButton: UIButton!
    @IBOutlet weak var CloseButton: UIButton!
    
    
    
    // Portrait
    @IBOutlet weak var TextBoxBottom: NSLayoutConstraint!
    @IBOutlet weak var PopViewBottom: NSLayoutConstraint!
    @IBOutlet weak var PopViewHeight: NSLayoutConstraint!
    
    // Landscape
    @IBOutlet weak var TextBoxTrailing: NSLayoutConstraint!
    @IBOutlet weak var PopViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var PopViewWidth: NSLayoutConstraint!
    
    let photoPickerViewController: UIImagePickerController = UIImagePickerController()
    
    
    // MARK: - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).interfaceOrientations = [.portrait, .landscapeLeft, .landscapeRight]
        
        photoPickerViewController.sourceType = .photoLibrary
        photoPickerViewController.delegate = self
        
        File.loadFont()
        
        self.BackgroundEffectView.effect = nil
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        //self.TextBoxShadowView.add(Shadow: UIView.Shadow(radius: 10, opacity: 0.15, Yoffset: 5))
        self.TextBox.InputAccessoryInit(in: self)
        self.TextBox.StyleInit(in: self)
        self.TextBox.SizeInit(in: self)
        
        self.TextBox.adaptiveScaling()
        
        self.PopView.heightInit(in: self)
        
        //self.TextBox.TopInit(in: self)
        //self.PopViewMoveDownOperation()
        //self.TextBox.MoveTo0(in: self)
        //self.TextBox.UpdateTopToCenter(in: self)
        
        self.TextBoxEditView.FontInit()
        
        self.TextBoxLabel.text = "轻触此处，编辑文字".localize()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if self.isFirstAppear
        {
            self.isFirstAppear = false
            self.PopViewMoveDownOperation()
        }
    }
    
    @objc func keyboardChanged(_ notification: Notification)
    {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        let keyboardHeight = keyboardViewEndFrame.height
        
        
        if notification.name == UIResponder.keyboardWillShowNotification
        {
            if System.isDeviceLandscape()
            {
                self.TextBox.moveBottom(to: 20, in: self)
            }
            else
            {
                self.TextBox.moveBottom(to: keyboardHeight - Size.BottomHeight() - 50.0, in: self)
            }
            
            Size.KeyboardHeight = keyboardHeight
        }
        else
        {
            self.TextBox.MoveTo0(in: self)
        }
        self.TextBox.UpdateToCenter(in: self)
        
    }
    
    
    @objc func orientationChanged(_ notification: Notification)
    {
        let orient = UIDevice.current.orientation
        if orient != .landscapeLeft && orient != .landscapeRight && orient != .portrait
        {
            return
        }
        if System.currentOrientation != orient
        {
            System.currentOrientation = orient
            //self.TextBox.InputAccessoryInit(in: self)
            self.PopView.heightInit(in: self)
            self.PopViewMoveDownOperation()
            self.PopViewModelCollectionView.reloadData()
            Size.reload()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.PopViewMoveDownOperation()
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
        System.FeedbackGenerator(style: .light)
        self.TextBoxEditView.resignFirstResponder()
        self.PopView.popUp(with: .Model,  in: self)
        self.TextBox.MoveForPop(in: self)
        self.TextBox.UpdateToCenter(in: self)
    }
    
    @IBAction func AdjustmentButtonUpInside(_ sender: UIButton) {
        System.FeedbackGenerator(style: .light)
        self.TextBoxEditView.resignFirstResponder()
        self.PopView.popUp(with: .Adjustment, in: self)
        self.TextBox.MoveForPop(in: self)
        self.TextBox.UpdateToCenter(in: self)
    }
    
    @IBAction func ExportButtonUpInside(_ sender: UIButton) {
        System.FeedbackGenerator(style: .light)
        self.TextBox.Export(in: self)
    }
    
    @IBAction func PopViewCancelButtonUpInside(_ sender: UIButton) {
        PopViewMoveDownOperation()
    }
    
    // MARK: - Function
    
    func PhotoSelect()
    {
        self.present(self.photoPickerViewController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        guard let selectedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            print("data error!")
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(selectedImage.size, false, 0.0)
        selectedImage.draw(in: CGRect(origin: CGPoint.zero, size: selectedImage.size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        Style.Adjustment.customImage = newImage
        Style.Adjustment.Update(in: self)
        Style.UpdateBackgroundAndDark(in: self)
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    
    
    // MARK: - TextBox & TextBoxView
    
    @IBAction func TextBoxViewTapped(_ sender: UITapGestureRecognizer) {
        PopViewMoveDownOperation()
    }
    
    func PopViewMoveDownOperation()
    {
        self.PopView.popDown(in: self)
        self.TextBox.MoveTo0(in: self)
        self.TextBoxTurnToEdit(toEdit: false)
    }
    
    @IBAction func TextBoxTapped(_ sender: UITapGestureRecognizer) {
        if self.TextBoxEditView.isFirstResponder
        {
            return
        }
        System.FeedbackGenerator(style: .light)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        self.TextBoxTurnToEdit(toEdit: true)
    }
    
    // TextBoxView change selection
    func textViewDidChangeSelection(_ textView: UITextView) {
        self.TextBoxEditView.GetAndSetCurrentAlignment()
    }
    
    
    // MARK: - Edit Accessory View
    
    @objc func KeyboardButton(_ sender: UIButton)
    {
        System.FeedbackGenerator(style: .light)
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
            if self.TextBoxEditView.isFirstResponder
            {
                self.TextBoxLabel.attributedText = self.TextBoxEditView.attributedText
            }
            self.TextBoxEditView.resignFirstResponder()
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
        System.FeedbackGenerator(style: .light)
        KeyboardView.FontOperation(tag: sender.tag, in: self)
    }
    
    // FontSizeView Button UpInside
    @objc func KeyboardFontSizeViewButton(_ sender: UIButton)
    {
        System.FeedbackGenerator(style: .light)
        KeyboardView.FontSizeOperation(tag: sender.tag, in: self)
    }
    
    @objc func KeyboardFontViewDeleteButton(_ sender: UIButton)
    {
        System.FeedbackGenerator(style: .light)
        KeyboardView.FontDeleteOperation(tag: sender.tag, in: self)
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
    
    
    // MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Style.NameArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return Style.GeneratePreviewCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: (collectionView.contentSize.width - Size.PopView.CollectionViewGap * 4.0) / 3.0, height: (collectionView.contentSize.width - Size.PopView.CollectionViewGap * 4.0) / 3.0)
        return CGSize(width: Size.PopView.CollectionViewLength(), height: Size.PopView.CollectionViewLength())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Size.PopView.CollectionViewGap(), left: Size.PopView.CollectionViewGap(), bottom: Size.PopView.CollectionViewGap(), right: Size.PopView.CollectionViewGap())
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Style.ChangeTo(item: indexPath.item, in: self)
        //AdjustmentCell.reloadData()
        //self.PopViewModelCollectionView.reloadData()
        self.PopViewAdjustmentTableView.reloadData()
        /*for currentType in Style.Adjustment.displayType[Style.current]!
        {
            let tableCell = self.PopViewAdjustmentTableView.cellForRow(at: IndexPath(row: 0, section: Style.Adjustment.displayTypeIndex(type: currentType, in: Style.current)!)) as! AdjustmentSelectionTypeCell
            tableCell.SingleSelectionCollectionView.reloadData()
        }*/
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.pop(duration: Constant.AnimationInterval.Middle, delay: 0, doing: {
            collectionView.cellForItem(at: indexPath)?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // MARK: - UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Style.Adjustment.displayType[Style.current]!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdjustmentSelectionType")! as! AdjustmentSelectionTypeCell
        cell.tag = indexPath.section
        cell.SingleSelectionCollectionView.reloadData()
        cell.SingleSelectionCollectionView.selectItem(at: IndexPath(item: Style.Adjustment.current[Style.Adjustment.displayType[Style.current]![indexPath.section]]!, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredVertically)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Style.Adjustment.SectionTitle[Style.Adjustment.displayType[Style.current]![section]]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Style.Adjustment.TableCellHeight[Style.Adjustment.displayType[Style.current]![indexPath.section]]!
        //return Style.Adjustment.CellSize[Style.Adjustment.typeArray[indexPath.item]]!.height * 2.0 + 45.0
    }
    
    
    /*
    
    // MARK: - ScrollView
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.TextBox
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.TextBox.UpdateTopToCenter(in: self)
        self.TextBox.UpdateLeadingToCenter(in: self)
    }*/
    
    
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
    
    
    // MARK: - URL And Session
    var recivedData = NSMutableData()
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        self.recivedData.append(data)
        
        let currentBytes = Float(self.recivedData.length)
        let allTotalBytes = Float((dataTask.response?.expectedContentLength)!)
        
        let percent = Float(currentBytes / allTotalBytes)
        
        print("Downloading: \(percent) %")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("Download completely!")
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        completionHandler(.allow)
    }
    
    
}

