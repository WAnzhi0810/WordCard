//
//  WelcomeUI.swift
//  TextBox
//
//  Created by OX CL on 2019/7/31.
//  Copyright © 2019 OX CL. All rights reserved.
//

import UIKit

class WelcomeUI: UIViewController {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TextBox: UIView!
    
    static var currentLabel = 1
    @IBOutlet weak var TextBoxLabel1: UILabel!
    @IBOutlet weak var TextBoxLabel2: UILabel!
    @IBOutlet weak var TextBoxLabel3: UILabel!
    @IBOutlet weak var ToMainUIButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TitleLabel.alpha = 0
        self.TitleLabel.text = "欢迎使用\n文字卡片"
        self.TextBox.backgroundColor = UIColor.white
        self.TextBox.alpha = 0
        self.TextBoxLabel1.textColor = UIColor.black
        self.TextBoxLabel2.textColor = UIColor.black
        self.TextBoxLabel3.textColor = UIColor.black
        self.ToMainUIButton.alpha = 0
        self.ToMainUIButton.isUserInteractionEnabled = false
        
        self.StartAnimation()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ToMainUI(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainUI")
        self.present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func StartAnimation()
    {
        UIView.linear(duration: 1, delay: 0, doing: {
            self.TitleLabel.alpha = 1
        }) { (true) in
            
        }
        
        UIView.linear(duration: 1, delay: 1.5, doing: {
            self.TextBox.alpha = 1
        }) { (true) in
            self.BackgroundAnimation(i: 1)
        }
        
        UIView.linear(duration: 1, delay: 5, doing: {
            self.ToMainUIButton.alpha = 1
        }) { (true) in
            self.ToMainUIButton.isUserInteractionEnabled = true
        }
        
        
        
    }
    
    func BackgroundAnimation(i: Int)
    {
        self.ChangeTextBoxLabel()
        UIView.linear(duration: 3, delay: 1, doing: {
            self.TextBox.backgroundColor = Style.Adjustment.PreviewValue.BGColor[i]
            self.view.backgroundColor = Style.Adjustment.PreviewValue.BackgroundViewColor[i]
        }) { (true) in
            self.BackgroundAnimation(i: i == 12 ? 1 : i + 1)
        }
    }
    
    func ChangeTextBoxLabel()
    {
        switch WelcomeUI.currentLabel
        {
        case 1:
            self.ChangeLabelAnimation(label1: self.TextBoxLabel1, label2: self.TextBoxLabel2, currentLabelTo: 2)
        case 2:
            self.ChangeLabelAnimation(label1: self.TextBoxLabel2, label2: self.TextBoxLabel3, currentLabelTo: 3)
        case 3:
            self.ChangeLabelAnimation(label1: self.TextBoxLabel3, label2: self.TextBoxLabel1, currentLabelTo: 1)
        default:
            break
        }
    }
    
    func ChangeLabelAnimation(label1: UILabel, label2: UILabel, currentLabelTo: Int)
    {
        WelcomeUI.currentLabel = currentLabelTo
        UIView.linear(duration: 1.5, delay: 0, doing: {
            label1.alpha = 0
        }, completion: nil)
        UIView.linear(duration: 1.5, delay: 1.5, doing: {
            label2.alpha = 1
        }, completion: nil)
    }
}
