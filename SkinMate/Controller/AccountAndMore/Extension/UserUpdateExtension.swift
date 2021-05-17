//
//  UserUpdateExtension.swift
//  SkinMate
//
//  Created by Datamatics on 12/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit

extension UserUpdateViewController : UITextFieldDelegate {
    // when user select a textfield, this method will be called
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // set the activeTextField to the selected textfield
        self.activeTextField = textField
    }
    
    // when user click 'done' or dismiss the keyboard
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
            // if keyboard size is not available for some reason, dont do anything
            return
        }
        
        var shouldMoveViewUp = false
        
        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            
            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        // move back the root view origin to zero
        self.view.frame.origin.y = 0
    }
    
    func checkInsurance(){
        if txtInsur.text == ""{
            txtInsur.layer.borderWidth = 0.50
            txtInsur.layer.masksToBounds = true
            txtInsur.layer.borderColor = UIColor.red.cgColor
            validInsurance = false
            validCredentials()
        }
        else{
            txtInsur.layer.borderWidth = 0.15
            txtInsur.layer.masksToBounds = true
            txtInsur.layer.borderColor = UIColor.lightGray.cgColor
            validInsurance = true
            validCredentials()
            
        }
    }
    func checkEmerganceName(){
        if txtContact.text == ""{
            txtContact.layer.borderWidth = 0.50
            txtContact.layer.masksToBounds = true
            txtContact.layer.borderColor = UIColor.red.cgColor
            validEName = false
            validCredentials()
        }
        else{
            txtContact.layer.borderWidth = 0.15
            txtContact.layer.masksToBounds = true
            txtContact.layer.borderColor = UIColor.lightGray.cgColor
            validEName = true
            validCredentials()
            
        }
    }
    func checkPhone(){
        
        let isValidPhone = isValidPhoneNumber(UserPhone: txtNumber.text!)
        if txtNumber.text == "" {
            lblContactError.text = "Enter valid Phone Number"
            txtNumber.layer.borderWidth = 0.50
            txtNumber.layer.masksToBounds = true
            txtNumber.layer.borderColor = UIColor.red.cgColor
            validPhone = false
            validCredentials()
        } else if (isValidPhone == true) {
            lblContactError.text = ""
            txtNumber.layer.borderWidth = 0.15
            txtNumber.layer.masksToBounds = true
            txtNumber.layer.borderColor =  UIColor.lightGray.cgColor
            validPhone = true
            
            validCredentials()
            return
        }else{
            lblContactError.text = "Invalid Phone Number"
            txtNumber.layer.borderWidth = 0.50
            txtNumber.layer.masksToBounds = true
            txtNumber.layer.borderColor = UIColor.red.cgColor
            validPhone = false
            validCredentials()
        }
    }
    
    public func isValidPhoneNumber(UserPhone: String) -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: UserPhone, options: [], range:NSMakeRange(0,UserPhone.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == UserPhone.count && UserPhone.count == 10
                
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    func validCredentials() {
        if  validPhone == true || validEName == true || validInsurance == true {
            btnCreate.isEnabled = true
            btnCreate.alpha  = 1.0
            btnCreate.backgroundColor = #colorLiteral(red: 0.4588235294, green: 0.6117647059, blue: 0.6784313725, alpha: 1)
        }
        else{
            btnCreate.isEnabled = false
            btnCreate.alpha  = 0.5
        }
    }
}

