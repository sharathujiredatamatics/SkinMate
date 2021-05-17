//
//  Validation.swift
//  SkinMate
//
//  Created by Datamatics on 06/05/21.
//  Copyright © 2021 Datamatics. All rights reserved.
//

import UIKit
extension SignInViewController {
    
    func checkUserId() {
        passwordError.text = ""
        let isValidPhone = validPhone(phone: signInPhoneNumberFiled.text!)
        let isValidEmail = validEmail(email: signInPhoneNumberFiled.text!)
        if signInPhoneNumberFiled.text == "" {
            phoneNumberError.text = "Please Enter Phone Number or Email"
            signInPhoneNumberFiled.layer.borderWidth = 0.50
            signInPhoneNumberFiled.layer.masksToBounds = true
            signInPhoneNumberFiled.layer.borderColor = UIColor.red.cgColor
            validUserId = false
            validUserPassword()
        }
        else if isValidPhone == true || isValidEmail == true {
            phoneNumberError.text = ""
            signInPhoneNumberFiled.layer.borderWidth = 0.15
            signInPhoneNumberFiled.layer.masksToBounds = true
            signInPhoneNumberFiled.layer.borderColor = UIColor.lightGray.cgColor
            validUserId = true
            validUserPassword()
            return
        }else{
                phoneNumberError.text = "Please Enter Valid Phone Number or Email"
            signInPhoneNumberFiled.layer.borderWidth = 0.50
            signInPhoneNumberFiled.layer.masksToBounds = true
                signInPhoneNumberFiled.layer.borderColor = UIColor.red.cgColor
                validUserId = false
                validUserPassword()
            return
        }
    }
    func checkPassword(){
        let isValidPassword = validPassword(password: signInPasswordField.text!)
        
        if signInPasswordField.text == "" {
            passwordError.text = "Enter password"
            signInPasswordField.layer.borderWidth = 0.50
            signInPasswordField.layer.masksToBounds = true
            signInPasswordField.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
        } else if (isValidPassword == true) {
            passwordError.text = ""
            signInPasswordField.layer.borderWidth = 0.15
            signInPasswordField.layer.masksToBounds = true
            signInPasswordField.layer.borderColor = UIColor.lightGray.cgColor
            validPassword = true
            
            validUserPassword()
            return
        }else{
            passwordError.text = "Invalid Phone Number/Password Combination"
            signInPasswordField.layer.borderWidth = 0.50
            signInPasswordField.layer.masksToBounds = true
            signInPasswordField.layer.borderColor = UIColor.red.cgColor
            validPassword = false
            validUserPassword()
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
    public func validPassword(password: String) -> Bool {
        let pass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePass = NSPredicate(format: "SELF MATCHES %@", pass)
        let isValidPassword = validatePass.evaluate(with: trimmedString)
        return isValidPassword
    }
    func validUserPassword(){
        if validUserId == true && validPassword == true{
            signInButton.isEnabled = true
            signInButton.alpha  = 1.0
        }
        else{
            
            signInButton.isEnabled = false
            signInButton.alpha  = 0.5
        }
    }
    func checkPhoneOrEmail(){
        if let validData = signInPhoneNumberFiled.text, validData.isDigit(){
            userIdPhone =  signInPhoneNumberFiled.text!
            userIdEmail = ""
        }
        else{
            userIdEmail =  signInPhoneNumberFiled.text!
            userIdPhone = ""
        }
    }
    
}
extension String{
    func isDigit() -> Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
}
