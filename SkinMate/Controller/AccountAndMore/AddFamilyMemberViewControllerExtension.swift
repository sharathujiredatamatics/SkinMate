//
//  AddFamilyMemberViewControllerExtension.swift
//  SkinMate
//
//  Created by Datamatics on 13/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
// Extension for validate all the textfields of Add Family view.
extension AddFamilyMemberViewController : UITextFieldDelegate {
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
    
    func checkFirstName(){
        txtFirst.layer.borderWidth = 1.0
        txtFirst.layer.masksToBounds = true
        txtFirst.layer.borderColor = UIColor.lightGray.cgColor
        validFirstName = false
        validCredentials()
    }
    func checkFirstNameEnd(){
        if txtFirst.text == ""{
            txtFirst.layer.borderWidth = 1.0
            txtFirst.layer.masksToBounds = true
            txtFirst.layer.borderColor = UIColor.red.cgColor
            validFirstName = false
            validCredentials()
        }
        else{
            txtFirst.layer.borderWidth = 1.0
            txtFirst.layer.masksToBounds = true
            txtFirst.layer.borderColor = UIColor.lightGray.cgColor
            validFirstName = true
            validCredentials()
            
        }
    }
    func checkLastName(){
        txtLast.layer.borderWidth = 1.0
        txtLast.layer.masksToBounds = true
        txtLast.layer.borderColor = UIColor.lightGray.cgColor
        valilidLastName = false
        validCredentials()
    }
    func checkLastNameEnd(){
        if txtLast.text == ""{
            txtLast.layer.borderWidth = 1.0
            txtLast.layer.masksToBounds = true
            txtLast.layer.borderColor = UIColor.red.cgColor
            valilidLastName = false
            validCredentials()
        }
        else{
            txtLast.layer.borderWidth = 1.0
            txtLast.layer.masksToBounds = true
            txtLast.layer.borderColor = UIColor.lightGray.cgColor
            valilidLastName = true
            validCredentials()
            
        }
    }
    func checkRelation(){
        relation.layer.borderWidth = 1.0
        relation.layer.masksToBounds = true
        relation.layer.borderColor = UIColor.lightGray.cgColor
        validRelationship = false
        validCredentials()
    }
    func checkRelationEnd(){
        if relation.text == ""{
            relation.layer.borderWidth = 1.0
            relation.layer.masksToBounds = true
            relation.layer.borderColor = UIColor.red.cgColor
            validRelationship = false
            validCredentials()
        }
        else{
            relation.layer.borderWidth = 1.0
            relation.layer.masksToBounds = true
            relation.layer.borderColor = UIColor.lightGray.cgColor
            validRelationship = true
            validCredentials()
            
        }
    }
    //    func checkBlood(){
    //        if txtBlood.text == ""{
    //            txtBlood.layer.borderWidth = 1.0
    //            txtBlood.layer.masksToBounds = true
    //            txtBlood.layer.borderColor = UIColor.red.cgColor
    //            validBloodGroup = false
    //            validCredentials()
    //        }
    //        else{
    //            txtBlood.layer.borderWidth = 1.0
    //            txtBlood.layer.masksToBounds = true
    //            txtBlood.layer.borderColor = UIColor.lightGray.cgColor
    //            validBloodGroup = true
    //            validCredentials()
    //            
    //        }
    //    }
    //    func checkDOB(){
    //        if txtDate.text == ""{
    //            txtDate.layer.borderWidth = 0.50
    //            txtDate.layer.masksToBounds = true
    //            txtDate.layer.borderColor = UIColor.red.cgColor
    //            validDOB = false
    //            validCredentials()
    //        }
    //        else{
    //            txtDate.layer.borderWidth = 0.15
    //            txtDate.layer.masksToBounds = true
    //            txtDate.layer.borderColor = UIColor.lightGray.cgColor
    //            validDOB = true
    //            validCredentials()
    //
    //        }
    //    }
    func checkInsurance(){
        txtInsur.layer.borderWidth = 1.0
        txtInsur.layer.masksToBounds = true
        txtInsur.layer.borderColor = UIColor.lightGray.cgColor
        validInsurance = false
        validCredentials()
    }
    func checkInsuranceEnd(){
        if txtInsur.text == ""{
            txtInsur.layer.borderWidth = 1.0
            txtInsur.layer.masksToBounds = true
            txtInsur.layer.borderColor = UIColor.red.cgColor
            validInsurance = false
            validCredentials()
        }
        else{
            txtInsur.layer.borderWidth = 1.0
            txtInsur.layer.masksToBounds = true
            txtInsur.layer.borderColor = UIColor.lightGray.cgColor
            validInsurance = true
            validCredentials()
            
        }
    }
    func checkEmerganceName(){
        txtContact.layer.borderWidth = 1.0
        txtContact.layer.masksToBounds = true
        txtContact.layer.borderColor = UIColor.lightGray.cgColor
        validEName = false
        validCredentials()
    }
    func checkEmerganceNameEnd(){
        if txtContact.text == ""{
            txtContact.layer.borderWidth = 1.0
            txtContact.layer.masksToBounds = true
            txtContact.layer.borderColor = UIColor.red.cgColor
            validEName = false
            validCredentials()
        }
        else{
            txtContact.layer.borderWidth = 1.0
            txtContact.layer.masksToBounds = true
            txtContact.layer.borderColor = UIColor.lightGray.cgColor
            validEName = true
            validCredentials()
            
        }
    }
    func checkPhone(){
        lblContactError.text = ""
        txtNumber.layer.borderWidth = 1.0
        txtNumber.layer.masksToBounds = true
        txtNumber.layer.borderColor =  UIColor.lightGray.cgColor
        validPhone = false
        validCredentials()
    }
    func checkPhoneEnd(){
        let isValidPhone = isValidPhoneNumber(UserPhone: txtNumber.text!)
        if txtNumber.text == "" {
            lblContactError.text = "Enter valid Phone Number"
            txtNumber.layer.borderWidth = 1.0
            txtNumber.layer.masksToBounds = true
            txtNumber.layer.borderColor = UIColor.red.cgColor
            validPhone = false
            validCredentials()
        } else if (isValidPhone == true) {
            lblContactError.text = ""
            txtNumber.layer.borderWidth = 1.0
            txtNumber.layer.masksToBounds = true
            txtNumber.layer.borderColor =  UIColor.lightGray.cgColor
            validPhone = true
            
            validCredentials()
            return
        }else{
            lblContactError.text = "Invalid Phone Number"
            txtNumber.layer.borderWidth = 1.0
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
        if  validPhone == true && validEName == true && validInsurance == true && validFirstName == true && valilidLastName == true && validRelationship == true{
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


