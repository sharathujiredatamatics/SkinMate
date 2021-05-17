//
//  ValidationForgotPassword.swift
//  SkinMate
//
//  Created by Datamatics on 07/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//



import UIKit
extension ForgotPasswordViewController{
    func checkUserId() {
    let isValidPhone = validPhone(phone: phoneNumberField.text!)
    let isValidEmail = validEmail(email: phoneNumberField.text!)
    if phoneNumberField.text == "" {
    errorPhoneNumber.text = "Please Enter Phone Number or Email"
        phoneNumberField.layer.borderWidth = 0.50
        phoneNumberField.layer.masksToBounds = true
        phoneNumberField.layer.borderColor = UIColor.red.cgColor
    validUserId = false
    validUserPassword()
    }
    else if isValidPhone == true || isValidEmail == true {
    errorPhoneNumber.text = ""
        phoneNumberField.layer.borderWidth = 0.15
        phoneNumberField.layer.masksToBounds = true
        phoneNumberField.layer.borderColor = UIColor.lightGray.cgColor
    validUserId = true
    validUserPassword()
    return
    }else{
    errorPhoneNumber.text = "Please Enter Valid Phone Number or Email"
        phoneNumberField.layer.borderWidth = 0.50
        phoneNumberField.layer.masksToBounds = true
        phoneNumberField.layer.borderColor = UIColor.red.cgColor
    validUserId = false
    validUserPassword()
        return
    }
}
    
    
    public func validPhone(phone: String) -> Bool {
        let phno = "^[0-9]\\d{9}$"
        let trimmedString = phone.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phno)
        let isValidPhone = validatePhone.evaluate(with: trimmedString)
        return isValidPhone
    }
    public func validEmail(email: String) -> Bool {
        let emailId = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,3})$"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "SELF MATCHES %@", emailId)
        let isValidEmail = validateEmail.evaluate(with: trimmedString)
        return isValidEmail
    }
    func validUserPassword(){
        if validUserId == true {
            continueForgotPasswordButton.isEnabled = true
            continueForgotPasswordButton.alpha  = 1.0
        }
        else{
            continueForgotPasswordButton.isEnabled = false
            continueForgotPasswordButton.alpha  = 0.5
        }
    }
    func checkPhoneOrEmail(){
        if let validData = phoneNumberField.text, validData.isDigit(){
            userIdPhone =  phoneNumberField.text!
            userIdEmail = ""
        }
        else{
            userIdEmail =  phoneNumberField.text!
            userIdPhone = ""
        }
    }
}

