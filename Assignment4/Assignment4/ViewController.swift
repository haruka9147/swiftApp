//
//  ViewController.swift
//  Assignment4
//
//  Created by 北田晴佳 on 2018/05/24.
//  Copyright © 2018 com.Haruka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var culculateBtn: UIButton!
    @IBOutlet weak var percentageLabel: UILabel!
    var percentageVal: Double = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        culculateBtn.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        culculateBtn.layer.borderWidth = 1.0
        culculateBtn.layer.cornerRadius = 5.0
        
        billAmountTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.configureObserver()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        self.removeObserver() // Notificationを画面が消えるときに削除
    }
    
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // Notificationを削除
    func removeObserver() {
        
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    // キーボードが現れた時に、画面全体をずらす。
    @objc func keyboardWillShow(notification: Notification?) {
        
        let rect = (notification?.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            let transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
            self.view.transform = transform
            
        })
    }
    
    // キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(notification: Notification?) {
        
        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            
            self.view.transform = CGAffineTransform.identity
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        culculator()
    }

    @IBAction func percentageSlider(_ sender: UISlider) {
        percentageLabel.text = "\(Int(sender.value))%"
        percentageVal = Double(sender.value)
        culculator()
    }
    
    @IBAction func culculateTip(_ sender: UIButton) {
        if let billAmount = Double(billAmountTextField.text!) {
            let amountWithTip = billAmount + (billAmount * (percentageVal / 100))
            tipAmountLabel.text = String(format: "$%.2f", amountWithTip)
        }
    }
    
    func culculator() {
        if let billAmount = Double(billAmountTextField.text!) {
            let amountWithTip = billAmount + (billAmount * (percentageVal / 100))
            tipAmountLabel.text = String(format: "$%.2f", amountWithTip)
        }
    }
}

